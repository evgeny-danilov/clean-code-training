# frozen_string_literal: true

def call
  ['Minsk', 'Berlin'].detect do |city_name|
    address.start_with?(city_name)
  end
end
