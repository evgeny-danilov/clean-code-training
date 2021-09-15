# frozen_string_literal: true

class UserController < ApplicationController
  include UserCalculations

  def new
    @user = User.find(params[:id])
    @payload = user_calculation
  end
end

# app/controllers/concerns/user_calculations.rb
module UserCalculations
  def user_calculation
    user_amount * 3
  end

  def user_amount
    @user.amount
  end
end
