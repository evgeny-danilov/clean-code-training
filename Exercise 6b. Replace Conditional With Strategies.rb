# frozen_string_literal: true

def call
  if address.start_with?('Minsk')
    'Minsk'
  elsif address.start_with?('Berlin')
    'Berlin'
  end
end
