# frozen_string_literal: true

def call
  GetValuationService.new(
    Calculator.new(
      CalculatorInput.new(params: params)
    )
  ).call
end

# Some points regarding such an approach:
#   1. It looks beautiful, but why?
#   2. In fact, there is no way easy to debug it and check input params
#   3. ...and no way to describe the code by meaningful naming
