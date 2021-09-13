# frozen_string_literal: true

def expected_payment_period_for(offset)
  payment_month = current_date.prev_month(offset)
  highest_offset = DURATION_MONTHS[:ninety_days]

  period_start = offset == highest_offset ? nil : payment_month.beginning_of_month
  period_start..payment_month.end_of_month
end
