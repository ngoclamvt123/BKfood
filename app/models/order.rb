class Order < ApplicationRecord
  after_create_commit { FoodOrderBroadcastJob.perform_later self }
end
