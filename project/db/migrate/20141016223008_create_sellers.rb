class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :personId
      t.integer :document
      t.string :username
      t.string :userLastName
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :telephone
      t.string :userType
      t.boolean :status

      t.timestamps
    end
  end
end
