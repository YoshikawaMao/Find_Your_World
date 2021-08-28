class Admin::AnimeUrlsController < ApplicationController
  before_action :authenticate_admin!

  # 戻るを押した時用のindexページ(中身はanimes/show)
  def index
    @anime = Anime.find(params[:id])
    @anime_voices = AnimeVoice.where(anime_id: params[:id])
    @comments = Comment.where(anime_id: params[:id])
    @anime_url = AnimeUrl.new
    @anime_urls = AnimeUrl.where(anime_id: params[:id])
    render "admin/animes/show"
  end

  def create
    @anime_url = AnimeUrl.new(anime_url_params)
    if @anime_url.save
      flash[:notice] = "投稿完了しました"
      redirect_back(fallback_location: root_path)
      # redirect_to admin_anime_path(params[:id])
    else
      @anime = Anime.find(params[:id])
      @anime_voices = AnimeVoice.where(anime_id: params[:id])
      @comments = Comment.where(anime_id: params[:id])
      @anime_urls = AnimeUrl.where(anime_id: params[:id])
      render "admin/animes/show"
      # redirect_back(fallback_location: root_path)
      # createのsaveしない場合はrenderで書く！エラー文が表示されないため
      # renderの時は飛ばすページの情報書くの忘れずに！
    end
  end

  def destroy
    @anime_url = AnimeUrl.find(params[:id])
    @anime_url.destroy
    flash[:notice] = "削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

  def anime_url_params
    params.require(:anime_url).permit(:address, :anime_id)
  end
end
