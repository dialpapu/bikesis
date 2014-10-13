class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :personId
      t.integer :document
      t.string :personName
      t.string :lastName
      t.string :telephone
      t.boolean :personStatus
      t.date :birthDay
      t.boolean :publicity

      t.timestamps
    end
  end
end
