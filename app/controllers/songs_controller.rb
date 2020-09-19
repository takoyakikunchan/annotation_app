class SongsController < ApplicationController
  before_action :move_to_login, only: [:new]
  before_action :set_song, only: [:show, :destroy, :edit, :update]
  def index
    @songs = Song.all.includes(:user).order(id: 'DESC')
  end

  def new
    @song = SongsArtist.new
  end
 
  def create
    date = params.require(:songs_artist).permit(:sales_date)
    sales_date = Date.parse( date["sales_date(1i)"] + "-" + date["sales_date(2i)"] + "-" + date["sales_date(3i)"] )
    @song = SongsArtist.new(song_params.merge(sales_date: sales_date))
    url = params[:songs_artist][:youtube_url]
    url = url.last(11)
    @song.youtube_url = url

    if @song.valid?
      @song.save
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
  @producer=@song.producer
  @featuring=@song.featuring
end

def update
  date = params.require(:song).permit(:sales_date)
  sales_date = Date.parse( date["sales_date(1i)"] + "-" + date["sales_date(2i)"] + "-" + date["sales_date(3i)"] )
  song = SongsArtist.new(song_update_params.merge(sales_date: sales_date))

  if song.image == nil
    song.image = @song.image.blob
  end

  if song.valid?
     song.update
    @song = Song.find(params[:id])
    @comment = Comment.new
    @comments = @song.comments.includes(:user)
    render :show
  else
    @song = Song.find(params[:id])
    @artist =@song.artists
    @producer=@song.producer
    @featuring=@song.featuring
    render :edit
  end
end

def destroy
  if @song.destroy
    redirect_to root_path
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
    params.require(:songs_artist).permit(:name, :text, :image, :translate, :youtube_url, :genre_id, :art_name,:featuring_name,:producer_name).merge(user_id: current_user.id)
  end

  # Update
  def song_update_params
    params.require(:song).permit(:name, :text, :image, :translate, :youtube_url, :genre_id,:art_name,:featuring_name,:producer_name).merge(user_id: current_user.id,song_id: params[:id])
  end
  def set_song
    @song = Song.find(params[:id])
  end
end
