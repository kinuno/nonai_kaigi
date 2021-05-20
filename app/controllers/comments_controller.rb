class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @room = Room.find(params[:room_id])
    @character = Character.where(room_id: @room.id)
    @comments = Comment.where(room_id: @room.id)
    @comment = Comment.new
  end

  def create
    @room = Room.find(params[:room_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to room_comments_path(@room.id)
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:text, :character_id).merge(user_id: current_user.id, room_id:params[:room_id])
  end

end
