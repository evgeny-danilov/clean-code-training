# frozen_string_literal: true

class GetPendingOrders
  # Major traits of objects inherited from Struct are that:
  #   - keywords can be skipped silently, without raising errors
  #   - objects are mutable by default, while Value Objects tend to be immutable. However, we can use `freeze` to avoid mutations
  #   - objects are comparable by attribute values, and it is how Value Objects should work
  # 
  # Check out more information here:
  #   https://thepugautomatic.com/2013/08/struct-inheritance-is-overused/
  # or here: https://longliveruby.com/articles/ruby-struct

  class Order < Struct.new(:date, :time, :address, keyword_init: true)
    def formatted_date
      Date.parse(date).strftime('%Y/%d/%m')
    end

    def formatted_time
      Time.parse(time).strftime('%H:%M')
    end

    def formatted_address
      address.strip
    end
  end
end

# 2.7.1 > GetPendingOrders::Order.new(date: '2020-01-01', time: '12:00', address: '   Berlin')
# 
# => #<struct GetPendingOrders::Order date="2020-01-01", time="12:00", address="   Berlin">
