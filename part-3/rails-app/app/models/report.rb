# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :invitations
end

# == Schema Info
#
# Table name: reports
#
#  id                  :integer(11)    not null, primary key
#
