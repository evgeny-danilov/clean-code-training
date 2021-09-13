# frozen_string_literal: true

def call
  input_values = CalculatorInput.new(params: params)
  calculator = Calculator.new(input_values)
  
  GetValuationService.new(calculator).call
end

# Now, you can place breakpoint in the method, and check all input variables
