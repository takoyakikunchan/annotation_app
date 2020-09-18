class ArtistProfilesController < ApplicationController
  def new
    @art_profile= ArtistProfile.new
    @artist=Artist.find(params[:artist_id])
  end
  def create
    artist=Artist.find(params[:artist_id])
    @art_profile=ArtistProfile.new(profile_params)
    if @art_profile.save
      redirect_to artist_path(artist.id)
    end
 end 
  private

  def profile_params
    params.require(:artist_profile).permit(:biography, :image,:insta,:twitter).merge(artist_id: params[:artist_id])
  end
end  
