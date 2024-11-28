# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationViewContext do
  subject { described_class.new(view_context, current_user: current_user) }

  let(:current_user) { build(:user) }
  let(:view_context) do
    ActionView::TestCase::TestController.new.tap do |test_controller|
      test_controller.params = { report_id: 1 }
    end.view_context
  end

  it 'provides #view_report_link method' do
    expected_link = '/admin/reports/1'

    expect(subject.view_report_link).to eq("<a href=\"#{expected_link}\">View Report</a>")
  end
end
