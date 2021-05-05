# frozen_string_literal: true

class Tipper

  def initialize(amount:, discount_percentage: 0, tip_percentage:)
    @amount = amount
    @discount_percentage = discount_percentage
    @tip_percentage = tip_percentage
  end

  def total
    amount + (amount * 0.05) - (amount * (discount_percentage / 100.0)) + (amount * (tip_percentage / 100.0))
  end

  private

  attr_reader :amount, :discount_percentage, :tip_percentage

end
