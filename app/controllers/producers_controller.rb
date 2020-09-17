class ProducersController < ApplicationController
  def index
  end
  def show
    @producer=Producer.find(params[:id])
  end
end
