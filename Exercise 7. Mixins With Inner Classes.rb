
# frozen_string_literal: true

class UserController < ApplicationController
  include UserCalculations

  def new
    @user = User.find(params[:id])
    @payload = user_calculation(@user)
  end
end

# app/controllers/concerns/user_calculations.rb
module UserCalculations
  def user_calculation(user)
    UserRepresenter.new(user).calculation
  end

  class UserRepresenter
    def initialize(user)
      @user = user
    end

    def calculation
      user.amount * 3
    end

    private

    attr_reader :user
  end
end
