# frozen_string_literal: true

def expected_payment_period_for(offset)
  payment_month = current_date.prev_month(offset)

  if offset == DURATION_MONTHS[:ninety_days]
    nil..payment_month.end_of_month
  else
    payment_month.beginning_of_month..payment_month.end_of_month
  end
end
