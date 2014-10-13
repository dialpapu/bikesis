class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :productId
      t.string :productReference, :limit=>10
      t.string :productName, :limit=>50
      t.string :productTradeMark, :limit=>50
      t.string :productImage, :limit=>100
      t.integer :productPrice
      t.boolean :productStatus
      t.string :productDescription, :limit=>300
      t.string :measures, :limit=>50
      t.string :bikeType, :limit=>50
      #t.timestamps
    end
  end
end
