class Admin::AnimesController < ApplicationController

  def index
    animes = Anime.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @animes = Kaminari.paginate_array(animes).page(params[:page]).per(12)
    # @animes = Anime.all.page(params[:page]).per(15)
    @anime = Anime.new
    @genres = Genre.all
  end


  def show
    @anime = Anime.find(params[:id])
    @anime_voices = AnimeVoice.where(anime_id: params[:id])
    @comments = Comment.where(anime_id: params[:id])
    @anime_url = AnimeUrl.new
    @anime_urls =AnimeUrl.where(anime_id: params[:id])
  end


  def edit
    @anime = Anime.find(params[:id])
    @genres = Genre.all
  end

  def update
    @anime = Anime.find(params[:id])
    if @anime.update(anime_params)
      flash[:notice] = "変更しました"
      redirect_to admin_anime_path(@anime.id)
    else
      @genres = Genre.all
      render :edit
    end
  end

  # アニメのtitle
  def destroy
    @anime = Anime.find(params[:id])
    @anime.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_animes_path
  end

  def anime_params
    params.require(:anime).permit(:title, :genre_id, :anime_url_id)
  end
end
