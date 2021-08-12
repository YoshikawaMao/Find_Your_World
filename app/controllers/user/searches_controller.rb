class User::SearchesController < ApplicationController

  def search
    @value = params["search"]["value"]
    @datas = Anime.where(genre_id: @value)
    @genres = Genre.all
  end

end
