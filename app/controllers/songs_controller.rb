class SongsController < ApplicationController
  before_action :move_to_login, only: [:new]
  def index
    @songs = Song.all.includes(:user).order(id: 'DESC')
  end

  def new
    @song = SongArtist.new
  end

  def create
    @song = SongArtist.new(song_params)
    url = params[:song_artist][:youtube_url]
    url = url.last(11)
    @song.youtube_url = url

    if @song.save
      render :create
    else
      render :new
    end
  end

def show
  @song = Song.find(params[:id])
end


  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def song_params
    params.require(:song_artist).permit(:name, :text, :image, :translate, :youtube_url, :genre_id, :art_name,:producer,:featuring).merge(user_id: current_user.id)
  end
end
