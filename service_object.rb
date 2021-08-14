# frozen_string_literal: true

# app/services/create_user.rb
module Services
  class CreateUser
    def initialize(form:)
      @form = form
    end

    def call
      raise NotUniqueEmail if User.find_by(email: form.email)

      User.create!(form.attributes) 
    end

    private

    attr_reader :form
  end
end
