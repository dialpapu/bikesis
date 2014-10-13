class CreateHistorialContratos < ActiveRecord::Migration
  def change
    create_table :historial_contratos do |t|
      t.integer :idPersona
      t.date :fechaContrato
      t.date :fechaFinContrato

     # t.timestamps
    end
  end
end
