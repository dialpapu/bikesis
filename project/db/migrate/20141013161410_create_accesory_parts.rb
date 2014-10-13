class CreateAccesoryParts < ActiveRecord::Migration
  def change
    create_table :accesory_parts do |t|
      t.integer :productId
      t.string :productReference
      t.string :productName
      t.string :productTradeMark
      t.string :productImage
      t.integer :productPrice
      t.boolean :productStatus
      t.string :productDescription
      t.string :typeElement

      t.timestamps
    end
  end
end
