class User::FavoritesController < ApplicationController
  def create
    @anime = Anime.find(params[:anime_id])
    @favorite = current_user.favorites.new(anime_id: @anime.id)
    @favorite.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @anime = Anime.find(params[:anime_id])
    @favorite = current_user.favorites.find_by(anime_id: @anime.id)
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
  end
end
