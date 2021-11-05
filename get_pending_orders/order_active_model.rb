# frozen_string_literal: true

class GetPendingOrders
  # Major traits of objects used `ActiveModel::Model` are that:
  #   - keywords can be skipped silently, without raising errors
  #   - objects are mutable by default, while Value Objects tend to be immutable. However, we can use `freeze` to avoid mutations
  #   - objects are not comparable by attribute values

  class Order
    include ActiveModel::Model

    attr_accessor :date, :time, :address

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
# => #<GetPendingOrders::Order:0xa553f8 @date="2020-01-01", @time="12:00", @address="   Berlin"> 
