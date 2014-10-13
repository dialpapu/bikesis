class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :personId, null: false 
      t.integer :document, null: false
      t.string :personName, null:false, :limit => 50
      t.string :lastName, null:false, :limit => 50
      t.string :telephone, null:false, :limit => 20
      t.boolean :personStatus, null: false
      #t.timestamps
    end
  end
end
