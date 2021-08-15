class User::VoicesController < ApplicationController

  def index
    @voices = Voice.all
  end

  def show
    @voice = Voice.find(params[:id])
    @anime_voices = @voice.anime_voices
  end

end
