# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :report

  def sender_name
    sender&.name || 'unknown'
  end

  def displayed_recipients
    recipient_email if report.active?
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
