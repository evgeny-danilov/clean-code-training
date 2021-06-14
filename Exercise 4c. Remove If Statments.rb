# frozen_string_literal: true

def benefit_rate
  return 0.5 if employee_on_vacation? && lenght_of_vacation > 1.week

  1.0
end
