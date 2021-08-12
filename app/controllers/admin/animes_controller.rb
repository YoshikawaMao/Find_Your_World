class Admin::AnimesController < ApplicationController

  def index
    @animes = Anime.all.page(params[:page]).per(15)
    # @animes = Anime.where(genre_id: params[:genre_id])
    @anime = Anime.new
    @genres = Genre.all
  end
end
