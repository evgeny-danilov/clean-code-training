# frozen_string_literal: true

class PhoneNumberFormatValidator < ActiveModel::Validator
  PHONE_REGEX = /^[0-9]{9}$/

  def validate(record)
    unless record.phone_number.nil? || record.phone_number =~ PHONE_REGEX
      record.errors[:phone_number] << "invalid phone number format"
    end
  end
end 
