class User::AnimesController < ApplicationController

  def index
    animes = Anime.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @animes = Kaminari.paginate_array(animes).page(params[:page]).per(20)
    # @animes = Anime.all.page(params[:page]).per(15)
    @anime = Anime.new
    @genres = Genre.all
  end

  def show
    @anime = Anime.find(params[:id])
    @voices = Voice.all
    @voice = Voice.new
    @anime_voices = AnimeVoice.where(anime_id: params[:id])
    #@anime_voices = AnimeVoice.where(voice_id: params[:id])
    @comment = Comment.new
    @comments = Comment.where(anime_id: params[:id])
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
    # user_idはpermitの中に入れても取って来れないからmerge(カラム名: 追加したいデータ値)で欲しい値を指定する必要がある
  end
end
