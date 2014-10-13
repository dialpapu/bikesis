class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
      t.integer :idVenta
      t.integer :idVendedor
      t.integer :idCliente
      t.date :fechaVenta
      t.boolean :estadoVenta
      t.text :observaciones, :limit=>300

      t.timestamps
    end
  end
end
