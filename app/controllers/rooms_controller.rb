class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @room = Room.includes(:user).where(user_id: current_user.id).order('created_at DESC')
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_comments_path(@room.id)
    else 
      render :new
    end
  end

  def edit
    @characters = Character.where(room_id: @room.id)
  end

  def update
    if @room.update(room_params)
      redirect_to room_comments_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @room.destroy
  end


  private

  def room_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
