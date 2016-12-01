class CreateDetailOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :detail_orders do |t|
      t.integer  :dish_id
      t.integer  :quantity
      
      t.timestamps
    end
  end
end
