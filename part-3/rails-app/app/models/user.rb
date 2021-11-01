# frozen_string_literal: true

class User < ApplicationRecord
  def admin?
    true
  end
end

# == Schema Info
#
# Table name: users
#
#  id                  :integer(11)    not null, primary key
#  name                :string
#
