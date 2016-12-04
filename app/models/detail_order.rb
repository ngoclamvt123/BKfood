class DetailOrder < ApplicationRecord
  belongs_to :order
  belongs_to :dish

  validates :dish, :order, presence: true
  validate :dish_active
  validates :quantity, numericality: {greater_than: 0}

  def dish_active
    errors.add(:dish_id, "has been deactive") unless Dish.find(self.dish_id).isActive == true
  end
end
