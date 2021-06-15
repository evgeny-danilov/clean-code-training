# frozen_string_literal: true

# That's important to have here just classes (not initialized instances), to avoid possible side-effects.
GET_CITY_NAME_STRATEGIES = [
  GetCityName::Minsk,
  GetCityName::Berlin
]

def call
  GET_CITY_NAME_STRATEGIES
    .map(&:new)
    .detect { _1.applicable?(address) }
    .name
end

module GetCityName
  class Minsk
    def applicable?(address)
      address.start_with?('Minsk')
    end

    def name
      'Minsk'
    end
  end

  class Berlin
    def applicable?(address)
      address.start_with?('Berlin')
    end

    def name
      'Berlin'
    end
  end
end
