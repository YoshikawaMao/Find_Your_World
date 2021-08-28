class User::CommentsController < ApplicationController
  def create
    # paramusは箱　リクエストの中身をparamsに入れている
    anime_id = params[:anime_id]
    @anime = Anime.find(anime_id)
    comment = current_user.comments.new(comment_params)
    comment.anime_id = anime_id
    comment.save
    @comments = Comment.where(anime_id: anime_id)
    # 非同期にしたことによって@comments定義する必要有り
  end

  def destroy
    @anime = Anime.find(params[:anime_id])
    Comment.find_by(id: params[:id], anime_id: @anime.id).destroy
    @comments = Comment.where(anime_id: params[:anime_id])
    # 非同期にしたことによって@comments定義する必要有り
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
