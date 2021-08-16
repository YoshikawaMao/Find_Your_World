class User::CommentsController < ApplicationController

  def create
    @anime = Anime.find(params[:id])
    @comment = current_user.comments.new(comment_params)
    @comment.anime_id = anime.id
    @comment.save
    redirect_to user_anime_path(@anime.id)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :anime_id)
  end
end
