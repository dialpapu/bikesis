class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.integer :cantidadProductos
      t.integer :idProducto

    #  t.timestamps
    end
  end
end
