class RemoveColumnFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :detail_order_id
  end
end
