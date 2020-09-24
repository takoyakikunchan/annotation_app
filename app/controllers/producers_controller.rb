class ProducersController < ApplicationController
  def index
  end

  def show
    @producer = Producer.find(params[:id])
    @proprofile = @producer.producer_profile
  end
end
