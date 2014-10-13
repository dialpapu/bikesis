class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :personId
      t.integer :document
      t.string :personName, :limit => 50
      t.string :lastName, :limit => 50
      t.string :telephone, :limit => 20
      t.boolean :personStatus
      #t.timestamps
    end
  end
end
