class User::CommentsController < ApplicationController

  def create
    # paramusは箱　リクエストの中身をparamsに入れている
    anime_id = params[:anime_id]
    @anime = Anime.find(anime_id)
    comment = current_user.comments.new(comment_params)
    comment.anime_id = anime_id
    comment.save
    # redirect_back(fallback_location: root_path)
    # redirect_to user_anime_path(@anime.id)
    @comments = Comment.where(anime_id: anime_id)
  end

  def destroy
    @anime = Anime.find(params[:anime_id])
    Comment.find_by(id: params[:id], anime_id: @anime.id).destroy
    @comments = Comment.where(anime_id: params[:anime_id])
    # redirect_back(fallback_location: root_path)
    # redirect_to user_anime_path(@anime.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
