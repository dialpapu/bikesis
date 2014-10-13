class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :productId
      t.string :productReference
      t.string :productName
      t.string :productTradeMark
      t.string :productImage
      t.integer :productPrice
      t.boolean :productStatus
      t.string :productDescription
      t.string :size
      t.string :gender

      t.timestamps
    end
  end
end
