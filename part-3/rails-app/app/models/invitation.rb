# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :report

  validates :recipient_email, uniqueness: { scope: :report_id }
  # This is a bad practice: validation hit the DB implicitly.

  after_commit :update_report
  # Callbacks could cause implicit cascade changes across the whole DB.
  # Besides, they usually bring a lot of open questions:
  #  - is it outside the AR transaction?
  #  - what happens if creating failed?
  #  - should we handle somehow failed transations?

  private

  def update_report
    report.activate!
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
