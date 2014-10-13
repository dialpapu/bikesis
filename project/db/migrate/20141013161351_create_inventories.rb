class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :productAmount
      t.integer :productId
      #t.timestamps
    end
  end
end
