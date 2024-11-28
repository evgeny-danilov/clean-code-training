# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationService::Action, aggregate_failures: true do
  subject { described_class.new(params: invitation_params, current_user: current_user, report_id: report.id).call }

  let(:current_user) { create(:user) }
  let(:report) { create(:report) }

  context 'when input params are valid' do
    let(:invitation_params) { { comment: 'a comment', recipients: 'test1@mail.com, test2@mail.com' } }

    it 'creates invitations' do
      expect { subject }.to(
        change(Invitation, :count).by(2).and(
          have_enqueued_mail(Mailer, :invitation_notification).twice
        )
      )

      expect(subject.success?).to eq(true)
      expect(report.reload).to have_attributes(active: true)
    end

    context 'when there are existing invitations' do
      before do
        create(:invitation, recipient_email: 'test1@mail.com', report: report, sender: current_user)
      end

      it 'creates an invitation and return the list of invalid emails' do
        expect { subject }.to(
          change(Invitation, :count).by(1).and(
            have_enqueued_mail(Mailer, :invitation_notification)
            # Removed `twice` -- looks like it was a bug.
          )
        )

        expect(subject.success?).to eq(true)
        expect(report.reload).to have_attributes(active: true)
      end
    end
  end

  context 'when input params are invalid' do
    let(:invitation_params) { { comment: '', recipients: 'test1@mail.com, test2@mail.com' } }

    it 'creates invitations' do
      expect { subject }.not_to change(Invitation, :count)
      expect(Mailer).not_to have_been_enqueued

      expect(subject.success?).to eq(false)
      expect(subject.failure.errors.to_hash).to eq(comment: ['Please provide a comment for the report recipients'])
      expect(report.reload).not_to have_attributes(active: true)
    end
  end
end
