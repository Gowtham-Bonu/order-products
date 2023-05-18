class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :cost
      t.string :description
      t.string :brand

      t.timestamps
    end
  end
end
