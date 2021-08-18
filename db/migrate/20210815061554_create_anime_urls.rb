class CreateAnimeUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_urls do |t|
      t.text :address

      t.timestamps
    end
  end
end
