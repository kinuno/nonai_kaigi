class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to room_path(@room)
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to room_character_path(@room.id, @character.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to room_path(@room) if @character.destroy
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :personality).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
