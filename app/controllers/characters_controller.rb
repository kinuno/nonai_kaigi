class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def new
    @room = Room.find(params[:room_id])
    @characters = Character.where(room_id: @room.id)
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @characters = Character.where(room_id: @room.id)
    if @character.save
      redirect_to room_comments_path(@room.id)
    else 
      render :new
    end
  end

  def show
    @characters = Character.where(room_id: @room.id)
  end

  def edit
    @characters = Character.where(room_id: @room.id)
  end

  def update
    if @character.update(character_params)
      redirect_to room_character_path(@room.id, @character.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to room_comments_path(@room.id) if @character.destroy
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :personality, :color_id).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
