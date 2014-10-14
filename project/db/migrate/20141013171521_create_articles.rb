class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :articleId, null: false
      t.string :articleTitle, null: false, :limit => 50
      t.integer :managerId, null: false
      t.date :publicationDate, null: false
      t.text :body, null: false, :limit => 1000
      t.text :summary, null:false, :limit => 300
      t.boolean :articleState, null: false
      #t.timestamps
    end
  end
end
