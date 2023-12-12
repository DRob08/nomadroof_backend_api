class UserMailer < ApplicationMailer
    def confirmation_email(user)
      @user = user
      @confirmation_url = "http://localhost:3001/confirm-email/#{@user.confirmation_token}"
      mail(to: @user.email, subject: 'Confirm your email address')
    end
  end
  