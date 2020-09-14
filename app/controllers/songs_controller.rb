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
  @comment = Comment.new
  @comments = @song.comments.includes(:user)
end

def edit
  @song = Song.find(params[:id])
  @artist =@song.artists
end

def update
  binding.pry
  @song = SongArtist.new(song_update_params)
  if @song.update
    @song = Song.find(params[:id])
    @comment = Comment.new
    @comments = @song.comments.includes(:user)
    render :show
  else
    render :edit
  end
end

def destory
  if @song.destroy
    redirect_to songs_path
  else
    render :show
  end
end
def search
  @songs = Song.search(params[:keyword])
  @keyword = params[:keyword]
  if @songs== nil
    redirect_to root_path
  end
end
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  private
# Create
  def song_params
    params.require(:song_artist).permit(:name, :text, :image, :translate, :youtube_url, :genre_id, :art_name,:producer,:featuring).merge(user_id: current_user.id)
  end

  # Update
  def song_update_params
    params.require(:song).permit(:name, :text, :image, :translate, :youtube_url, :genre_id, :art_name,:producer,:featuring).merge(user_id: current_user.id)
  end
end
