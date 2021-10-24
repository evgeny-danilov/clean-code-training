# frozen_string_literal: true

class InvitationsController < ApplicationController
  EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.freeze

  def new
    @report = Report.find(params[:report_id])

    render :new, locals: { object: form.result_object }
  end

  def create # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @report = Report.find(params[:report_id])
    result = form.result_object(validate: true)

    if result.validation.success?
      form.recipients.each do |email|
        invitation = Invitation.create(
          report: @report,
          sender: current_user,
          recipient_email: email,
          status: 'pending'
        )
        Mailer.invitation_notification(invitation, form.comment).deliver_now
      end

      redirect_to new_invitation_path(@report), notice: 'Invitation successfully sent'
    else
      render :new, locals: { object: result }
    end
  end

  private

  def form
    @form ||= InvitationForm.new(params[:invitation].to_h.symbolize_keys)
  end
end
