# frozen_string_literal: true

class ReportsController < ApplicationController
  include RecipientsChecksMixin

  before_action :set_report

  def new
  end

  def create
    if valid_recipients? && valid_comment?
      recipient_list.each do |email|
        Invitation.create(
          report: @report,
          sender: current_user,
          recipient_email: email
        )
      end

      redirect_to report_path(@report), notice: 'Invitation successfully sent'
    else
      @missing_comment = true unless valid_comment?
      render :new
    end
  end

  private

  def set_report
    @report ||= Report.find(params[:id])
  end

  def recipient_list
    @recipient_list ||= recipients.split(/[\n,;]+/).map(&:strip)
  end

  def recipients
    @recipients ||= params[:invitation][:recipients]
  end

  def comment
    @comment ||= params[:invitation][:comment]
  end
end
