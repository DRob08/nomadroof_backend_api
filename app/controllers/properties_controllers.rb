class PropertiesController < ApplicationController
    include CurrentUserConcern
    
    before_action :set_current_user
    def create
        property_params = params.require(:property).permit(
          :name, :description, :latitude, :longitude, :features_and_amenities,
          :max_guests, :availability, :monthly_price, :weekly_price, :daily_price,
          :status, :booked_start_date, :booked_end_date, :cat_property_id
        )
    
        property = @current_user.properties.build(property_params)

        if property.save
          render json: { property: property }, status: :created
        else
          render json: { errors: property.errors.full_messages }, status: :unprocessable_entity
        end
      end
end