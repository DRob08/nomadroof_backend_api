# app/controllers/confirmations_controller.rb
class ConfirmationsController < ApplicationController
    def confirm_email
      user = User.find_by(confirmation_token: params[:token])
  
      if user
        user.update(confirmation_token: nil, confirmed_at: DateTime.now)
        render json: { status: :success, message: 'Email confirmed successfully.' }
      else
        render json: { status: :error, message: 'Invalid confirmation token.' }
      end
    end
  end
  