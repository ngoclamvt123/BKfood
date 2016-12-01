class Order < ApplicationRecord
  has_many :detail_orders
  
  after_create_commit { FoodOrderBroadcastJob.perform_later self }
end
