class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :idPersona
      t.integer :documento
      t.string :nombrePersona, :limit => 50
      t.string :apellido, :limit => 50
      t.string :telefono, :limit => 20
      t.boolean :estadoPersona
      t.date :fechaNacimiento
      t.boolean :permisoPublicidad

      t.timestamps
    end
  end
end
