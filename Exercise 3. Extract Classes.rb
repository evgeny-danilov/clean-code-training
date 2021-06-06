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
    form.amount + tax - discount + tip
  end

  def tax
    form.amount * TAX
  end

  def discount
    form.amount * (form.discount_percentage / 100.0)
  end

  def tip
    form.amount * (form.tip_percentage / 100.0)
  end

end
