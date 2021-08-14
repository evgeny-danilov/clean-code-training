# frozen_string_literal: true

# app/controllers/user_controller.rb
class UserController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:email, :name, :phone)
  end
end
