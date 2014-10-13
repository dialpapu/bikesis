class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
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
