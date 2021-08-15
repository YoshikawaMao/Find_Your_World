class User::AnimesController < ApplicationController

  def index
    @animes = Anime.all.page(params[:page]).per(15)
    @anime = Anime.new
    @genres = Genre.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

  #アニメのタイトル
  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      redirect_to user_animes_path
    else
      @animes = Anime.all
      render :index
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:genre_id, :title).merge(user_id: current_user.id)
    # user_idはpermitの中に入れても取って来れないからmerge(カラム名: 追加したいデータ値)で欲しい値を指定してあげる必要がある
  end
end
