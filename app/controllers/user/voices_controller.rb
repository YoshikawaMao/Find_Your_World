class User::VoicesController < ApplicationController

  def index
    @voices = Voice.all
  end

  def show
    @voice = voice.find(params[:id])
    @voice_animes = @voice.anime_id.title.all
  end

end
