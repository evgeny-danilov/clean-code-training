# frozen_string_literal: true

def benefit_rate
  if (employee_on_vacation?)
    if length_of_vacation > 1.week
      return 0.5
    end
  end

  1.0
end
