# frozen_string_literal: true

class InvitationPresenter
  def initialize(invitation, report:)
    @invitation = invitation
    @report = report
  end

  delegate :id, to: :invitation

  def sender_name
    invitation.sender&.name || 'unknown'
  end

  def displayed_recipients
    invitation.recipient_email if report.active?
  end

  private

  attr_reader :invitation, :report
end
