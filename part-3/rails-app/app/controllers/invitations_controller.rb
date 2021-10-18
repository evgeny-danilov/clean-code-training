# frozen_string_literal: true

class InvitationsController < ApplicationController
  EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.freeze

  def new
    @report = Report.find(params[:report_id])
  end

  def create # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @report = Report.find(params[:report_id])

    if valid_recipients? && valid_comment?
      recipient_list.each do |email|
        invitation = Invitation.create(
          report: @report,
          sender: current_user,
          recipient_email: email,
          status: 'pending'
        )
        Mailer.invitation_notification(invitation, comment).deliver_now
      end

      redirect_to new_invitation_path(@report), notice: 'Invitation successfully sent'
    else
      @recipients = recipients
      @comment = comment
      @missing_comment = true unless valid_comment?

      render :new
    end
  end

  private

  def valid_recipients?
    invalid_recipients.empty?
  end

  def valid_comment?
    comment.present?
  end

  def invalid_recipients
    @invalid_recipients ||= recipient_list.map do |item|
      item unless item.match(EMAIL_REGEX)
    end.compact
  end

  def recipient_list
    @recipient_list ||= recipients.to_s.split(/[\n,;]+/).map(&:strip)
  end

  def recipients
    params.dig(:invitation, :recipients)
  end

  def comment
    params.dig(:invitation, :comment)
  end
end
