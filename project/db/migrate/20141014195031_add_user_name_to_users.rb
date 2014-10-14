class AddUserNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :userLastName, :string
    add_column :users, :document, :integer
    add_column :users, :telephone, :string
    add_column :users, :userType, :string
    add_column :users, :status, :string
  end
end
