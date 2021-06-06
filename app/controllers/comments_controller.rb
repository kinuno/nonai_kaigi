class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:index, :create, :destroy]
  before_action :set_characters, only: [:index, :create]

  def index
    @comments = Comment.where(room_id: @room.id)
    @comment = Comment.new
  end

  def create
    @comments = Comment.where(room_id: @room.id)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to room_comments_path(@room.id)
    else
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to room_comments_path(@room.id) if @comment.destroy
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_characters
    @characters = Character.where(room_id: @room.id)
  end

  def comment_params
    params.require(:comment).permit(:text, :character_id).merge(user_id: current_user.id, room_id:params[:room_id])
  end
end
