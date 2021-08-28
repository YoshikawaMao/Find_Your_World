class User::SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]
    @datas = Anime.where(genre_id: @value).page(params[:page]).per(14)
    @genres = Genre.all
  end
end
