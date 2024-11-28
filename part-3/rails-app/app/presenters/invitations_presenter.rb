# frozen_string_literal: true

class InvitationsPresenter
  def initialize(invitations, report:)
    @invitations = invitations
    @report = report
  end

  def each
    invitations.each do |invitation|
      yield InvitationPresenter.new(invitation, report: report)
    end
  end

  private

  attr_reader :invitations, :report

  def invitation_presenter(invitation)
    InvitationPresenter.new(invitation, report: report)
  end
end
