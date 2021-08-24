class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

   def destroy
    @anime = Anime.find(params[:anime_id])
    Comment.find_by(id: params[:id], anime_id: @anime.id).destroy
    @comments = Comment.where(anime_id: params[:anime_id])
    flash[:notice] = "削除しました"
    redirect_back(fallback_location: root_path)
   end
end
