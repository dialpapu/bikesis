class CreateEquipaciones < ActiveRecord::Migration
  def change
    create_table :equipaciones do |t|
     t.integer :idProducto
      t.string :referenciaProducto, :limit=>10
      t.string :nombreProducto, :limit=>50
      t.string :marcaProducto, :limit=>50
      t.string :imagenProducto, :limit=>100
      t.integer :valorProducto
      t.boolean :estadoProducto
      t.string :descripcion, :limit=>300
      t.string :talla, :limit=>2
      t.string :genero, :limit=>1
  #    t.timestamps
    end
  end
end
