# frozen_string_literal: true

module Types
  include Dry.Types()
end

module InvitationService
  class Form < Dry::Struct
    include Dry::Monads[:result]

    RecipientsType = Types::Array.constructor do |input|
      input.split(/[\n,;]+/).map(&:strip).reject(&:blank?)
    end

    EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.freeze

    attribute? :recipients, RecipientsType
    attribute? :comment, Types::String

    def schema
      Dry::Schema.Params do
        config.messages.load_paths << Rails.root.join('config/locales/invitations/en.yml')

        required(:comment).filled(:string)
        required(:recipients).filled(:array?).array(format?: EMAIL_REGEX)
      end
    end

    def invalid_recipients
      return [] unless recipients

      recipients.grep_v(EMAIL_REGEX)
    end

    # DSL, can be implemented as a mixin
    def validate!
      validation = schema.call(attributes)
      return Success() if validation.success?

      Failure(ResultWithErrors.new(form: self, validation: validation))
    end

    # In case of using Simple Form gem it's required to have ActiveModel-like object with errors
    class ResultWithErrors
      include ActiveModel::Validations

      def initialize(form:, validation:)
        @form = form
        @validation = validation

        add_errors if validation.present?
      end

      delegate_missing_to :form

      private

      attr_reader :form, :validation

      def add_errors
        validation.errors.each do |error|
          field = error.to_h.keys.first
          errors.add(field, error.text)
        end
      end
    end

    # Example of usage:
    #
    # class UserController < ApplicationController
    #   def create
    #     result = form.validate!
    #
    #     if result.success?
    #       User.create(form.attributes)
    #       redirect_to some_url
    #     else
    #       render :new, { form: result.failure }
    #     end
    #   end
    #
    #   private
    #
    #   def form
    #     @form ||= UserForm.new(params.to_h)
    #   end
    # end
  end
end
