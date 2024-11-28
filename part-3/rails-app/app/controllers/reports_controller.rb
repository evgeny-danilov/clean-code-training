# frozen_string_literal: true

class ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
    @report_invitations = InvitationsPresenter.new(@report.invitations, report: @report)
  end
end
