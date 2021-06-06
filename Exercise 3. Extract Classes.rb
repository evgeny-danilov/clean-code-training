# frozen_string_literal: true

class TipsProcessor

  TAX = 0.05

  def initialize(form:)
    @form = form
  end

  def call
    SmsNotifier.new.call(text: sms_text)
  end

  private

  attr_reader :form

  def sms_text
    "You tips have been processed. Total amount is: #{total_amount}"
  end

  def total_amount
    TipsCalculator.new(form: form).call
  end

end
