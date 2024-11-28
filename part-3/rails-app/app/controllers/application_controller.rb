# frozen_string_literal: true

class ApplicationController < ActionController::Base
  ActionController::Parameters.permit_all_parameters = true

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end
end
