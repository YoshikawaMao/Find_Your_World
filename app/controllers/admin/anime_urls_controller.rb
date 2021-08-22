class Admin::AnimeUrlsController < ApplicationController

  def create
    @anime_url = AnimeUrl.new(anime_url_params)
    if @anime_url.save
      flash[:notice] = "投稿完了しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "投稿失敗しました"
      redirect_back(fallback_location: root_path)
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
