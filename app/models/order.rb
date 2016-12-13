class Order < ApplicationRecord

  enum status: [ :pending, :accepted, :complete, :canceled ]

  validates :name, :address, :phone, presence: true
  has_many :detail_orders
  
  after_create_commit { FoodOrderBroadcastJob.perform_later self }
end
