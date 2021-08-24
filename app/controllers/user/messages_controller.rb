class User::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "投稿しました"
      redirect_to user_messages_path
    else
      flash.now[:notice] = "投稿できませんでした"
      render :index
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to user_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:message_content).merge(user_id: current_user.id)
  end
end
