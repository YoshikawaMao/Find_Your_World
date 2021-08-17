class User::VoicesController < ApplicationController

  def index
    @voices = Voice.all
  end

  def show
    @voice = Voice.find(params[:id])
    @anime_voices = @voice.anime_voices
  end

  def create
    @voice = Voice.new(voice_params)
    @voice.user_id = current_user.id
    if @voice.save
      redirect_to user_anime_path(@voice.id)
    else
      render "animes/show"
    end
  end

  private
    def voice_params
      params.require(:voice).permit(:name)
    end
end
