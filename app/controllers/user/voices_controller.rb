class User::VoicesController < ApplicationController

  def index
    @voices = Voice.all
  end

  def show
    @voice = voice.find(params[:id])
  end

end
