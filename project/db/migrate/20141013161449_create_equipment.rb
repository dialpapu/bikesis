class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :productId
      t.string :productReference, :limit=>10
      t.string :productName, :limit=>50
      t.string :productTradeMark, :limit=>50
      t.string :productImage, :limit=>100
      t.integer :productPrice
      t.boolean :productStatus
      t.string :productDescription, :limit=>300
      t.string :size, :limit=>2
      t.string :gender, :limit=>1
      #t.timestamps
    end
  end
end
