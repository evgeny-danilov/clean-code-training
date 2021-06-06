# frozen_string_literal: true

class TipsCalculator

  TAX = 0.05

  def initialize(form:)
    @amount              = form.amount
    @discount_percentage = form.discount_percentage
    @tip_percentage      = form.tip_percentage
  end

  def call    
    amount + tax - discount + tip
  end

  private

  attr_reader :amount, :discount_percentage, :tip_percentage

  def tax
    amount * TAX
  end

  def discount
    amount * (discount_percentage / 100.0)
  end

  def tip
    amount * (tip_percentage / 100.0)
  end

end
