# app/controllers/properties_controller.rb
class PropertiesController < ApplicationController
    include CurrentUserConcern
    before_action :set_property, only: [:show, :update, :destroy]
  
    # GET /properties
    def index
      @properties = Property.all
      render json: @properties
    end
  
    # GET /properties/1
    def show
      render json: @property
    end
  
    # POST /properties
    def create
        @property = Property.new(property_params)
      
        if @property.save
          render json: { success: true, property: @property }, status: :created
        else
          render json: { success: false, errors: @property.errors.full_messages }, status: :unprocessable_entity
        end
     end
  
    # PATCH/PUT /properties/1
    def update
      if @property.update(property_params)
        render json: { success: true, property: @property }
      else
        render json: { success: false, errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end

  
    # DELETE /properties/1
    def destroy
      @property.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end
  
    

    # def property_params
    #     # Use @current_user to set the user_id
    #     params.require(:property).permit(
    #       :name, :description, :latitude, :longitude, :max_guests,
    #       :availability, :monthly_price, :weekly_price, :daily_price,
    #       :status, :booked_start_date, :booked_end_date, :cat_property_id,
    #       features_and_amenities: [] # Permit array of features_and_amenities
    #     ).merge(user_id: @current_user.id)
    #   end

      def property_params
        # Use @current_user to set the user_id
        params.require(:property).permit(
          :name, :description, :latitude, :longitude, :max_guests,
          :availability, :monthly_price, :weekly_price, :daily_price,
          :status, :booked_start_date, :booked_end_date, :cat_property_id,
          :size, :bedrooms, :bathrooms, :rooms, :city_fee,
          :cleaning_fee, :min_booking_months, :extra_price_per_guest,
          :verified, :country, :city, :property_address, :zip_code,
          features_and_amenities: [] # Permit array of features_and_amenities
        ).merge(user_id: @current_user.id)
      end
      
  end
  