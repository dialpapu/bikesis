class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :personId
      t.integer :document
      t.string :personName
      t.string :lastName
      t.string :telephone
      t.boolean :personStatus

      t.timestamps
    end
  end
end
