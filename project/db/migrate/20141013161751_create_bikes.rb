class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :productId, null: false
      t.string :productReference, null: false, :limit=>10
      t.string :productName, null: false, :limit=>50
      t.string :productTradeMark, null: false, :limit=>50
      t.integer :productPrice, null: false
      t.boolean :productStatus, null: false
      t.string :productDescription, null: false, :limit=>300
      t.string :measures, null: false, :limit=>50
      t.string :bikeType, null: false, :limit=>50
    end
  end
end
