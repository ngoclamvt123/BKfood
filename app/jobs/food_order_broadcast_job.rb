class FoodOrderBroadcastJob < ApplicationJob
  queue_as :default

  def perform(food_order)
    ActionCable.server.broadcast 'food_order_channel', food_order: render_food_order(food_order)
    # ActionCable.server.broadcast 'food_order_channel', food_order: data['food_order']
  end

  private
  def render_food_order(food_order)
    ApplicationController.renderer.render(partial: 'orders/order', locals: { food_order: food_order })
  end
end
