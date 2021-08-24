class Admin::VoicesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @voices = Voice.all
    @voice = Voice.new
  end

  def show
    @voice = Voice.find(params[:id])
    # @anime_voices = @voice.anime_voices
    @anime_voices = AnimeVoice.where(voice_id: @voice.id)
  end

  def create
    @voice = Voice.new(voice_params)
    if @voice.save
      flash[:notice] = "投稿完了しました"
      redirect_to admin_voices_path
    else
      @voices = Voice.all
      render :index
    end
  end

  def edit
    @voice = Voice.find(params[:id])
  end

  def update
    @voice = Voice.find(params[:id])
    if @voice.update(voice_params)
      flash[:notice] = "変更しました"
      redirect_to admin_voice_path(@voice.id)
    else
      render :edit
    end
  end

  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_voices_path
  end

  def search
    @voices = Voice.search(params[:keyword])
  end

  private

  def voice_params
    params.require(:voice).permit(:name)
  end
end
