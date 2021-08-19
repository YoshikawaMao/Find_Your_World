class RemoveAnimeUrlIdFromAnimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :animes, :anime_url_id, :integer
  end
end
