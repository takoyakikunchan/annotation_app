class ArtistsController < ApplicationController
  def index
  end
  def show
    @artist=Artist.find(params[:id])
    @artprofile = @artist.artist_profile
  end
end
