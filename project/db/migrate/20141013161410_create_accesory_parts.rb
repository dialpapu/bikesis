class CreateAccesoryParts < ActiveRecord::Migration
  def change
    create_table :accesory_parts do |t|
      t.integer :productId
      t.string :productReference, :limit=>10
      t.string :productName, :limit=>50
      t.string :productTradeMark, :limit=>50
      t.string :productImage, :limit=>100
      t.integer :productPrice
      t.boolean :productStatus
      t.string :productDescription, :limit=>300
      t.string :typeElement, :limit=>10
      t.timestamps
      #t.timestamps
    end
  end
end
