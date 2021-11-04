# frozen_string_literal: true

class GetPendingOrders
  def call
    api_response.map do |row|
      {
        date: format_date(row[:date]),
        time: format_time(row[:time]),
        address: row[:address].strip
      }
    end
  end

  private

  def api_response
    JSON.parse(HTTParty.get('api.server.com/get_orders?status=pending'))
  end

  def format_date(date)
    Date.parse(date).strftime('%Y/%d/%m')
  end

  def format_time(time)
    Time.parse(time).strftime('%H:%M')
  end
end

class SendPendingOrdersNotificationWorker
  def perform
    pendeing_orders.each do |order|
      PendingOrdersNotificationMailer.new(
        order_date: order[:date],
        order_time: order[:time],
        client_address: order[:address]
      ).deliver_later
    end
  end

  private

  def pending_orders
    GetPendingOrders.new.call
  end
end
