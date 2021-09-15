# frozen_string_literal: true

class Invitation < ApplicationRecord
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
