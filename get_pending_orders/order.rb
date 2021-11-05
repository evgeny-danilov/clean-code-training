# frozen_string_literal: true

class GetPendingOrders
  # Custom implementation of Value Objects is the simplest solution. It gives flexibility and explicit definitions, but requires more lines of code.

  class Order
    attr_reader :date, :time, :address

    def initialize(row)
      @date = format_date(row[:date])
      @time = format_time(row[:time])
      @address = row[:address].strip
    end

    private

    def format_date(date)
      Date.parse(date).strftime('%Y/%d/%m')
    end

    def format_time(time)
      Time.parse(time).strftime('%H:%M')
    end
  end
end

# 2.7.1 > GetPendingOrders::Order.new(date: '2020-01-01', time: '12:00', address: '   Berlin')
# 
# => #<GetPendingOrders::Order:0x768de0 @date="2020/01/01", @time="12:00", @address="Berlin"> 
