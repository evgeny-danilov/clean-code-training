# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationsController, type: :request, aggregate_failures: true do
  describe 'GET' do
    it 'renders a page' do
      report = Report.create

      get "/invitations/new?report_id=#{report.id}"
      expect(response).to be_successful
      expect(response.body).to include('View Report')
    end
  end

  describe 'POST' do
    it 'renders a page with errors' do
      report = Report.create
      invitation_params = { comment: '', recipients: '' }

      expect(Invitation).not_to receive(:create)
      expect do
        post '/invitations', params: { report_id: report.id, invitation: invitation_params }
      end.not_to have_enqueued_job

      expect(response.status).to eq(200)
      expect(response.body).to include('Invalid email addresses')
      expect(response.body).to include('Please provide a comment')
    end

    context 'when params are valid' do
      it 'creates Invitation record' do
        report = Report.create
        invitation_params = { comment: 'a comment', recipients: 'test@mail.com' }

        expect(Invitation).to receive(:create).and_call_original
        expect do
          post '/invitations', params: { report_id: report.id, invitation: invitation_params }
        end.to have_enqueued_job.on_queue('default')

        expect(response.status).to eq(302)
      end
    end

    context 'when some emails are invalid' do
      it 'creates Invitation record' do
        report = Report.create
        invitation_params = { comment: 'a comment', recipients: 'test@mail.com, my_mail' }

        expect(Invitation).not_to receive(:create)
        expect do
          post '/invitations', params: { report_id: report.id, invitation: invitation_params }
        end.not_to have_enqueued_job

        expect(response.status).to eq(200)
        expect(response.body).to include('Invalid email addresses: my_mail', 'a comment')
        expect(response.body).to include("\ntest@mail.com, my_mail")
      end
    end
  end
end
