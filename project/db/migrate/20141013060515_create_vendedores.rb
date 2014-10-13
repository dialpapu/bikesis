class CreateVendedores < ActiveRecord::Migration
  def change
    create_table :vendedores do |t|
      t.integer :idPersona
      t.integer :documento
      t.string :nombrePersona, :limit => 50
      t.string :apellido, :limit => 50
      t.string :telefono, :limit => 20
      t.boolean :estadoPersona

     # t.timestamps
    end
  end
end
