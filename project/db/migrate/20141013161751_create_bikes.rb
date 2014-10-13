class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :productId
      t.string :productReference
      t.string :productName
      t.string :productTradeMark
      t.string :productImage
      t.integer :productPrice
      t.boolean :productStatus
      t.string :productDescription
      t.string :measures
      t.string :bikeType

      t.timestamps
    end
  end
end
