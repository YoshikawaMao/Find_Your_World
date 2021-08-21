class Admin::VoicesController < ApplicationController

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
      redirect_to admin_voice_path(@voice.id)
    else
      render :edit
    end
  end

  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy
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
