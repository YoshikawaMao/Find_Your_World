class ChangeAnimeUrlsAnimeId < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_urls, :anime_id, :integer
  end
end