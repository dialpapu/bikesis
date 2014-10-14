class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :productId, null: false
      t.string :productReference,null: false, :limit=>10
      t.string :productName, null: false,:limit=>50
      t.string :productTradeMark, null: false, :limit=>50
      t.string :productImage, null: false, :limit=>100
      t.integer :productPrice, null: false
      t.boolean :productStatus, null: false
      t.string :productDescription, null: false, :limit=>300
      t.string :size, null: false, :limit=>2
      t.string :gender, null: false, :limit=>1
      #t.timestamps
    end
  end
end
