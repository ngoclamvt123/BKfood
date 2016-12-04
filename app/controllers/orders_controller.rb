class OrdersController < ApplicationController
  def show
    @orders = Order.includes(detail_orders: [:dish]).order(created_at: :desc)
  end
end
