class UsersController < ApplicationController
    include CurrentUserConcern
    
    before_action :set_current_user
    
    def update
        logger.info "Params before update: #{params.inspect}"
        logger.info "Current user before update: #{@current_user.attributes}"
      
        if @current_user.update(user_params)
          logger.info "Current user after update: #{@current_user.attributes}"
          render json: { message: 'Profile updated successfully', user: @current_user }
        else
          errors = @current_user.errors.full_messages
          logger.error "Update failed. Errors: #{errors}"
          render json: { error: 'Update failed', errors: errors.join(', ') }, status: :unprocessable_entity
        end
      rescue StandardError => e
        logger.error "An unexpected error occurred: #{e.inspect}"
        render json: { error: 'An unexpected error occurred', details: e.inspect }, status: :unprocessable_entity
      end
      
      
  
    private
  
    def user_params
      params.require(:user).permit(
        :country_of_origin,
        :first_name,
        :last_name,
        :whatsapp_number,
        :languages_spoken,
        :about_me,
        :dob,
        :instagram_handle,
        :twitter_handle,
        :linkedin_handle
      )
    end
  end
  