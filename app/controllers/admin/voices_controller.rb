class Admin::VoicesController < ApplicationController

  def index
    @voices = Voice.all
    @voice = Voice.new
  end

  def show
    @voice = Voice.find(params[:id])
    @anime_voices = @voice.anime_voices
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

  private

  def voice_params
    params.require(:voice).permit(:name)
  end
end
