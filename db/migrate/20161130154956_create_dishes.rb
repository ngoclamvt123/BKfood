class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :title
      t.text :description
      t.boolean :isActive
      t.float :price
      
      t.timestamps
    end
  end
end
