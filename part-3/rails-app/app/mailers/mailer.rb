# frozen_string_literal: true

class Mailer < ApplicationMailer
  def invitation_notification(invitation_id, _comment)
    Invitation.find(invitation_id)
    # do something
  end
end
