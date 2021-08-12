class User::SearchesController < ApplicationController

  def search
    # ここでジャンルid受け取る
    @content=params["search"]["value"]
    @records=Anime.search_for(@content)
  end
end
