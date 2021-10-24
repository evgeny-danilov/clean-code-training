# frozen_string_literal: true

class InvitationsController < ApplicationController
  EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.freeze

  def new
    @report = Report.find(params[:report_id])

    render :new, locals: { form: form, form_errors: nil }
  end

  def create # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @report = Report.find(params[:report_id])
    validation = form.validation

    if validation.success?
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
      render :new, locals: { form: form, form_errors: validation }
    end
  end

  private

  def form
    @form ||= InvitationForm.new(params[:invitation].to_h.symbolize_keys)
  end
end
