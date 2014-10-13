class CreateBicicleta < ActiveRecord::Migration
  def change
    create_table :bicicleta do |t|
     t.integer :idProducto
      t.string :referenciaProducto, :limit=>10
      t.string :nombreProducto, :limit=>50
      t.string :marcaProducto, :limit=>50
      t.string :imagenProducto, :limit=>100
      t.integer :valorProducto
      t.boolean :estadoProducto
      t.text :descripcion, :limit=>300
      t.string :medidas,:limit=>50
      t.string :tipoBicicleta, :limit=>50

  #    t.timestamps
    end
  end
end
