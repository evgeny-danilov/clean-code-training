# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationsController, type: :request do
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
      expect(response.body).to match(/Please provide a comment/)
      expect(response.body).to match(/Invalid email addresses/)
    end

    context 'when params are valid' do
      it 'creates Invitation record' do
        report = Report.create
        invitation_params = { comment: 'comment', recipients: 'test@mail.com' }

        post '/invitations', params: { report_id: report.id, invitation: invitation_params }

        expect(response.status).to eq(302)
        expect(response.body).not_to match(/Please provide a comment/)
        expect(response.body).not_to match(/Invalid email addresses/)
      end
    end
  end
end
