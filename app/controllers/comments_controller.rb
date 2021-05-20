class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def create
    @room = Room.find(params[:room_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to room_path(@room.id)
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:text, :character_id).merge(user_id: current_user.id, room_id:params[:room_id])
  end

end
