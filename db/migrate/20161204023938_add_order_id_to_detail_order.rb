class AddOrderIdToDetailOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :detail_orders, :order_id, :integer
  end
end
