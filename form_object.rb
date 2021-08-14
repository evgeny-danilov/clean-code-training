# frozen_string_literal: true

# app/forms/create_user.rb
#   ...actually, we can compact all forms and services inside the domain, (for ex: domains/user/forms/create.rb)

module Forms 
  class CreateUser < Dry::Struct 
    # It could be ActiveModel as well, but dry.rb libraries are more powerful
    #   Benefits of using `dry-struct` as a Form Object include immutability, deepen comparability (so, they could be used as a value object), and a powerful system of types.
    attribute :email, Types::String
    attribute? :name, Types::String
    attribute :phone, Types::String.default('undefined')

    def schema
      Dry::Schema.Params do
        required(:email).filled(:string)
        optional(:name).filled(:string)
        optional(:phone).filled(:string)
      end
    end

    def errors
      validation.errors
    end

    def valid!
      raise InvaildParams, validation.errors if validation.failure?
    end

    private

    def validation
      @validation ||= schema.call(attributes)
    end
  end
end
