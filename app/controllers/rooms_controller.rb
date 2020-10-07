class RoomsController < ApplicationController
  before_action :authenticate_user! 

  def search
  end

  def do_search
    @all_available_room = Room.search(params[:q])
    @room_categories = RoomCategory.where(id: @all_available_room.map(&:room_category_id).compact.uniq)
    render json: {rooms: @all_available_room, categories: @room_categories}
  end

end
