# frozen_string_literal: true

class InvitationViewContext
  def initialize(view_context, current_user:)
    @view_context = view_context
    @current_user = current_user
  end

  def view_report_link
    if current_user&.admin?
      view_context.link_to('View Report', view_context.admin_report_path(report_id))
    else
      view_context.link_to('View Report', view_context.report_path(report_id))
    end
  end

  private

  attr_reader :view_context, :current_user

  def report_id
    view_context.params[:report_id]
  end
end
