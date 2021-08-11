class User::AnimesController < ApplicationController

  def index
    @animes = Anime.all
    @anime = Anime.new
  end

  def show
    @anime = Anime.find(paramus[:id])
  end

  def create
    @anime = Anime.new(anime_paramus)
    if @anime.save
       redirect_to user_animes_path
    else
      @animes = Anime.all
      render :index
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:user_id, :genre_id, :title, :anime_url)
  end
end
