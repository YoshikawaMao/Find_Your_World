class Admin::AnimeUrlsController < ApplicationController

  def create
    @anime_url = AnimeUrl.new(anime_url_params)
    if @anime_url.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @anime_url = AnimeUrl.find(params[:id])
    @anime_url.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def anime_url_params
    params.require(:anime_url).permit(:address)
  end
end
