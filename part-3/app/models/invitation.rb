# frozen_string_literal: true

class Invitation < ApplicationRecord
  before_save :set_default_status
  after_save :send_notification

  private

  def send_notification
    Mailer.invitation_notification(invitation, comment).deliver_now
  end

  def set_default_status
    self.status ||= 'pending'
  end
end

# == Schema Info
#
# Table name: invitations
#
#  id                  :integer(11)    not null, primary key
#  report_id           :integer(11)    not null
#  sender_id           :integer(11)    not null
#  recipient_email     :string
#  status              :string
#
