class FeaturingsController < ApplicationController
  def index
  end
  def show
    @featuring=Featuring.find(params[:id])
  end
end
