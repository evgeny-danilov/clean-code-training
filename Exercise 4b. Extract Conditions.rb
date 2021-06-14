# frozen_string_literal: true

class PhoneNumberFormatValidator < ActiveModel::Validator
  PHONE_REGEX = /^[0-9]{9}$/

  def validate(record)
    unless valid_phone_number?(record)
      record.errors[:phone_number] << "invalid phone number format"
    end
  end

  private

  def valid_phone_number?(record)
    return true if record.phone_number.nil?

    record.phone_number =~ PHONE_REGEX
  end
end 
