class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :product
      t.string :name
      t.string :status
      t.integer :quantity
      
      t.timestamps
    end
  end
end
