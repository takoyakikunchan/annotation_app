class ProducerProfilesController < ApplicationController
    def new
      @pro_profile= ProducerProfile.new
      @producer=Producer.find(params[:producer_id])
    end
    def create
      producer=Producer.find(params[:producer_id])
      @pro_profile=ProducerProfile.new(profile_params)
      if @pro_profile.save
      redirect_to producer_path(producer.id)
      end
    end
    def edit
      @producer=Producer.find(params[:producer_id])
      @pro_profile=ProducerProfile.find(params[:id])
    end

    def update
      @producer=Producer.find(params[:producer_id])
      @pro_profile=ProducerProfile.find(params[:id])
    
    if @pro_profile.update(profile_params)
      redirect_to producer_path(@producer.id)
    else
      @producer= Producer.find(params[:producer_id])
      @pro_profile= ProducerProfile.find(params[:id])
      render :edit
    end
    end
  
    private
  
    def profile_params
      params.require(:producer_profile).permit(:biography, :image,:insta,:twitter).merge(producer_id: params[:producer_id])
    end
end  
