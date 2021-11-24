# frozen_string_literal: true

class InvitationsController < ApplicationController
  include Dry::Monads[:result]

  def new
    render :new, locals: { page: page, object: NullForm.new(invalid_recipients: []) }
  end

  def create
    report_id = page.report_id
    service = InvitationService::Action.new(params: invitation_params, current_user: current_user, report_id: report_id)

    service.call.bind do
      Success redirect_to(new_invitation_path(report_id), notice: 'Invitation successfully sent')
    end.or do |failure|
      render(:new, locals: { page: page, object: failure })
    end
  end

  private

  def invitation_params
    params[:invitation].to_h.symbolize_keys
  end

  def page
    @page ||= InvitationViewContext.new(view_context, current_user: current_user)
  end
end
