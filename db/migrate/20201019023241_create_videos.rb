class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.string :youtube_id
      t.datetime :published_at
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
