class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :saleId
      t.integer :sellerId
      t.integer :clientId
      t.date :saleDate
      t.boolean :saleStatus
      t.string :note

      t.timestamps
    end
  end
end
