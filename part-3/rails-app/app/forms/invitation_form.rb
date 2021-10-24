# frozen_string_literal: true

module Types
  include Dry.Types()
end

class InvitationForm < Dry::Struct 
  RecipientsType = Types::Array.constructor do |input|
    input.split(/[\n,;]+/).map(&:strip).reject(&:blank?)
  end
  
  EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.freeze

  attribute? :recipients, RecipientsType
  attribute? :comment, Types::String

  def schema
    Dry::Schema.Params do
      required(:comment).filled(:string)
      required(:recipients).array(format?: EMAIL_REGEX)
    end
  end

  def invalid_recipients
    return [] unless recipients

    recipients.select { |item| !item.match?(EMAIL_REGEX) }
  end

  def validation
    validation = schema.call(attributes)
  end
end
