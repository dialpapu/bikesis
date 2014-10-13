class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :saleId
      t.integer :productId
      t.integer :itemAmount
      #t.timestamps
    end
  end
end
