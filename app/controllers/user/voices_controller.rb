class User::VoicesController < ApplicationController

  def index
    @voices = Voice.all
  end

  def show
    @voice = Voice.find(params[:id])
    # @anime_voices = AnimeVoice.where(voice_id: params[:id])
    @anime_voices = AnimeVoice.where(voice_id: @voice.id)
  end

  def create
    # @voice = Voice.new(voice_params)
    @voice = AnimeVoice.new(voice_params)
    #@voice.user_id = current_user.id
    if @voice.save
      # redirect_to user_anime_path(@voice.id)
      redirect_back(fallback_location: root_path)
    else
      render "animes/show"
    end
  end

  private
    def voice_params
      # params.require(:voice).permit(:name)
      params.require(:voice).permit(:voice_id, :anime_id)
    end
end
