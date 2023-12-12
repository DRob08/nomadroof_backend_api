class SessionsController < ApplicationController
include CurrentUserConcern
    def create
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

        if user
            session[:user_id] = user.id 
            render json: {status: :created, 
            logged_in: true, 
            user: user}
        else
            render json: {status: 401}
        end
    end

    def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
    end 

    def logout
        reset_session
        session.clear
        @current_user = nil
        render json: { status: 200, logged_out: true }
      end
      

    def check_authentication
        if @current_user
          render json: { authenticated: true, user: @current_user }
        else
          render json: { authenticated: false }
        end
      end
end