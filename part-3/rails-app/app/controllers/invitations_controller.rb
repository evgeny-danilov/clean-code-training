# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new
    @report = Report.find(params[:report_id])

    render :new, locals: { object: form }
  end

  def create
    @report = Report.find(params[:report_id])
    InvitationService::Sender.new(form: form, current_user: current_user, report: @report).call

    redirect_to new_invitation_path(@report), notice: 'Invitation successfully sent'
  rescue InvitationForm::InvalidError => e
    render :new, locals: { object: e.form_with_errors }
  end

  private

  def form
    InvitationForm.new(params[:invitation].to_h.symbolize_keys)
  end
end
