class AnnotationsController < ApplicationController
  def new
    @annotation = Annotation.new
    @song = Song.find(params[:song_id])
  end

  def create
    @song = Song.find(params[:song_id])
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      render :create
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:song_id])
    @annotation = Annotation.find(params[:id])
  end

  def update
    @song = Song.find(params[:song_id])
    @annotation = Annotation.find(params[:id])

    if @annotation.update(annotation_params)
      redirect_to song_path(@song.id)
    else
      @song = Song.find(params[:song_id])
      @annotation = Annotation.find(params[:id])
      render :edit
    end
  end

  def destroy
  end

  private

  def annotation_params
    params.require(:annotation).permit(:image, :image_text, :album, :sample, :message, :relationship, :trouble, :slang, :intention, :info, :award).merge(song_id: params[:song_id])
  end
end
