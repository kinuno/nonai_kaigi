class CharactersController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @character = Character.new
  end

  def create
    @room = Room.find(params[:room_id])
    @character = Character.new(character_params)
    if @character.save
      redirect_to room_path(@room)
    else 
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :personality).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
