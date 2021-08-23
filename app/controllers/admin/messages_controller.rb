class Admin::MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.admin_id = current_admin.id
    if @message.save
      flash[:notice] = "投稿完了しました"
      redirect_to admin_messages_path
    else
      render :index
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:message_content)
    # .merge(admin_id: current_admin.id)　誰が書き込みしたか入れないとエラーが出るadmin_id入れるべき？
    # 今回はcreateで定義する方にしました
  end

end
