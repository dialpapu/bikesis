class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :articleId
      t.string :articleTitle
      t.integer :managerId
      t.date :publicationDate
      t.text :body, :limit => 1000
      t.text :summary, :limit => 300
      t.boolean :articleState
      #t.timestamps
    end
  end
end
