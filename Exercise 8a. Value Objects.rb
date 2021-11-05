# frozen_string_literal: true

class GetPendingOrders
  Order = Struct.new(:date, :time, :address, keyword_init: true)

  def call
    api_response.map do |row|
      Order.new(
        date: row.fetch(:date),
        time: row.fetch(:time),
        address: row.fetch(:address)
      ).freeze # that is important to freeze an object, because Structs are mutable by default
    end
  end

  private

  def api_response
    JSON.parse(HTTParty.get('api.server.com/get_orders?status=pending'))
  end
end

class SendPendingOrdersNotificationWorker
  def perform
    pendeing_orders.each do |order|
      PendingOrdersNotificationMailer.new(
        order_date: order.date,
        order_time: order.time,
        client_address: order.address
      ).deliver_later
    end
  end

  private

  def pending_orders
    GetPendingOrders.new.call
  end
end
