class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title
      t.text :anime_url

      t.timestamps
    end
  end
end
