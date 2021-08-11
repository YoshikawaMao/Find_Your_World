class User::AnimesController < ApplicationController

  def index
    @animes = Anime.all
    @anime = Anime.new
  end

  def show
    @anime = Anime.find(paramus[:id])
  end

  def create

  end

  private

  def anime_params
    params.require(:anime).permit(:user_id, :genre_id, :title, :anime_url)
  end
end
