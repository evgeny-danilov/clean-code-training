# frozen_string_literal: true

class GetPendingOrders
  # Major traits of dry-struct objects are that:
  #   - objects are IMMUTABLE and COMPARABLE by default
  #   - objects have powerful system of types, values are coercible
  # 
  # For more information check out official documentation: https://dry-rb.org/gems/dry-struct/

  class Order < Dry::Struct
    attribute :date, Dry.Types::Params::Date.constructor { |value| value.strftime('%Y/%d/%m') }
    attribute :time, Dry.Types::Params::Time.constructor { |value| value.strftime('%H:%M') }
    attribute :address, Dry.Types::String.constructor(&:strip)

    def formatted_address
      address.humanize
    end

    # .. any other custom methods
  end
end

# 2.7.1 > GetPendingOrders::Order.new(date: '2020-01-01', time: '12:00', address: '   Berlin')
# 
# => #<GetPendingOrders::Order date="2020/01/01" time="12:00" address="Berlin"> 
