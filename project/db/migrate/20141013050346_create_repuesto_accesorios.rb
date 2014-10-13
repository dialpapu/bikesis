class CreateRepuestoAccesorios < ActiveRecord::Migration
  def change
    create_table :repuesto_accesorios do |t|
      t.integer :idProducto
      t.string :referenciaProducto, :limit=>10
      t.string :nombreProducto, :limit=>50
      t.string :marcaProducto, :limit=>50
      t.string :imagenProducto, :limit=>100
      t.integer :valorProducto
      t.boolean :estadoProducto
      t.string :descripcion, :limit=>300
      t.string :tipoElemento, :limit=>10

      t.timestamps
    end
  end
end
