class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.datetime :published_at, precision: 6
      t.string :title
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
