class CommentsController < ApplicationController
  def create
    @song = Song.find(params[:song_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', { content: @comment, nickname: @comment.user.nickname, song: @song }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to "/songs/#{@comment.song.id}" if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, song_id: params[:song_id])
  end
end
