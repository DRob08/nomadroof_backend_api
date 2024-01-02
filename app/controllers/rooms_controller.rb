# app/controllers/rooms_controller.rb

class RoomsController < ApplicationController
    before_action :set_property
    before_action :set_room, only: [:show, :edit, :update, :destroy]
  
    def index
      @rooms = @property.rooms
    end
  
    def show
    end
  
    def new
      @room = @property.rooms.build
    end
  
    def create
      @room = @property.rooms.build(room_params)
  
      if @room.save
        redirect_to property_room_path(@property, @room), notice: 'Room was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @room.update(room_params)
        redirect_to property_room_path(@property, @room), notice: 'Room was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @room.destroy
      redirect_to property_rooms_path(@property), notice: 'Room was successfully destroyed.'
    end
  
    private
  
    def set_property
      @property = Property.find(params[:property_id])
    end
  
    def set_room
      @room = @property.rooms.find(params[:id])
    end
  
    def room_params
      params.require(:room).permit(:bedroom_number, :room_type, :occupancy, :room_size, :ensuite_bathroom, :description, :accessible, :nightly_price, :monthly_price, :images, :available, :booked, :check_in_date, :check_out_date, :bed_type)
    end
  end
  