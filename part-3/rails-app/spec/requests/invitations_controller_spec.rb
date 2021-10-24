# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationsController, type: :request, aggregate_failures: true do
  describe 'GET' do
    it 'renders a page' do
      report = Report.create

      get "/invitations/new?report_id=#{report.id}"
      expect(response).to be_successful
    end
  end

  describe 'POST' do
    it 'renders a page with errors' do
      report = Report.create

      post '/invitations', params: { report_id: report.id }

      expect(response.status).to eq(200)
      expect(response.body).to include('Please provide a comment', 'Invalid email addresses')
    end

    context 'when params are valid' do
      it 'creates Invitation record' do
        report = Report.create
        invitation_params = { comment: 'a comment', recipients: 'test@mail.com' }

        post '/invitations', params: { report_id: report.id, invitation: invitation_params }

        expect(response.status).to eq(302)
      end
    end

    context 'when some emails are invalid' do
      it 'creates Invitation record' do
        report = Report.create
        invitation_params = { comment: 'a comment', recipients: 'test@mail.com, my_mail' }

        post '/invitations', params: { report_id: report.id, invitation: invitation_params }

        expect(response.status).to eq(200)
        expect(response.body).to include("Invalid email addresses:\nmy_mail", 'a comment')
        expect(response.body).to include("\ntest@mail.com, my_mail")
      end
    end
  end
end
