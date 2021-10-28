# frozen_string_literal: true

class InvitationsController < ApplicationController
  include Dry::Monads[:result]

  def new
    @report = Report.find(params[:report_id])

    render :new, locals: { object: NullForm.new(invalid_recipients: []) }
  end

  def create
    @report = Report.find(params[:report_id])
    service = InvitationService::Sender.new(params: invitation_params, current_user: current_user, report: @report)

    service.call.bind do
      Success redirect_to(new_invitation_path(@report), notice: 'Invitation successfully sent')
    end.or do |failure|
      render(:new, locals: { object: failure })
    end
  end

  private

  def invitation_params
    params[:invitation].to_h.symbolize_keys
  end
end
