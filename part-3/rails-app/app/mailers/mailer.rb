# frozen_string_literal: true

class Mailer < ApplicationMailer
  def invitation_notification(invitation_id, comment)
    invitation = Invitation.find(invitation_id)
    # do something
  end
end
