# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportsController, type: :request do
  describe 'SHOW' do
    it 'renders a page' do
      user = User.create(name: 'First User')
      invitation = Invitation.new(sender: user)
      report = Report.create!(invitations: [invitation])
      get "/reports/#{report.id}"

      expect(response).to be_successful
      expect(response.body).to include('First User')
    end
  end
end
