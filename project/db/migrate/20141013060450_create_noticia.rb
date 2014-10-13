class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticia do |t|
      t.integer :idNoticia
      t.integer :idGerente
      t.date :fechaPublicacion
      t.text :cuerpo, :limit => 1000
      t.text :resumen, :limit => 300
      t.boolean :estadoNoticia

      #t.timestamps
    end
  end
end
