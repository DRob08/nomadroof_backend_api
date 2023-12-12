class RegistrationsController < ApplicationController
    def create
      user = User.create!(
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation'],
        first_name: params['user']['firstName'],
        last_name: params['user']['lastName'],
        country_of_origin: params['user']['country']
      )
  
      if user
        session[:user_id] = user.id
        # Send confirmation email
        UserMailer.confirmation_email(user).deliver_now
        render json: {
          status: :created,
          user: user
        }
      else
        render json: { status: 500 }
      end
    end
  
    def check_email
      email = params[:email]
  
      # Check if the email is already taken
      user = User.find_by(email: email)
  
      if user
        render json: { available: false }
      else
        render json: { available: true }
      end
    end

    private

    def registration_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :country_of_origin)
    end
  end
  