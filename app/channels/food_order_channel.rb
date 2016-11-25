# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class FoodOrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "food_order_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    #ActionCable.server.broadcast 'food_order_channel', food_order: data['food_order']
    Order.create!(name: data['food_order'])
  end
end
