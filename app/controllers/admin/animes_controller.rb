class Admin::AnimesController < ApplicationController

  def index
    @animes = Anime.all.page(params[:page]).per(15)
    # @animes = Anime.where(genre_id: params[:genre_id])
    @anime = Anime.new
    @genres = Genre.all
  end

  # アニメのurl
  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      redirect_to admin_animes_path
    else
      @animes = Anime.all
      render :index
    end
  end

  def destroy
    @anime = Anime.find(params[:id])
    @anime.destroy
    redirect_to admin_animes_path
  end

  def anime_params
    params.require(:anime).permit(:title, :anime_url)
  end
end
