class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :articleId
      t.integer :managerId
      t.date :publicationDate
      t.string :body
      t.string :summary
      t.boolean :articleState

      t.timestamps
    end
  end
end
