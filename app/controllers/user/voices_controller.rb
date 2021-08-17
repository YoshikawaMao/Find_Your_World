class User::VoicesController < ApplicationController

  def index
    @voices = Voice.all
  end

  def show
    @voice = Voice.find(params[:id])
    # @anime_voices = AnimeVoice.where(voice_id: params[:id])
    # findは１件、whereは複数件探してデータを持ってこられる
    @anime_voices = AnimeVoice.where(voice_id: @voice.id)
  end

  def create
    # user側からの声優の投稿は中間テーブルに入るようにするからモデル名はAnimeVoiceになる
    @voice = AnimeVoice.new(voice_params)
    if @voice.save
      # createしたら元のviewに戻る
      redirect_back(fallback_location: root_path)
    else
      render "animes/show"
    end
  end

  private
    def voice_params
      params.require(:voice).permit(:voice_id, :anime_id)

    end
end
