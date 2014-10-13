class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :idVenta
      t.integer :idProducto
      t.integer :cantidadItem

      t.timestamps
    end
  end
end
