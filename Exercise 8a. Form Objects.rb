# frozen_string_literal: true

# app/controllers/user_controller.rb
class UserController < ApplicationController
  def create
    form = Forms::CreateUser.new(params: user_params)
    form.valid!
    Services::CreateUser.new(form: form).call

    redirect_to user_url(user)
  rescue InvalidForm
    render :new, form: form
    # Note: Another good practice is to avoid @instance variables in controllers
  end

  private

  def user_params
    params[:user].to_h
  end
end
