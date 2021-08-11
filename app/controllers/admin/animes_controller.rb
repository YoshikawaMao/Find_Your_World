class Admin::AnimesController < ApplicationController

  def index
    @animes = Anime.where(genre_id: params[:genre_id])
    @anime = Anime.new
  end
end
