class User < ApplicationRecord
    has_secure_password

    enum role: { student: 0, admin: 1, host: 2 }
  
    validates_presence_of :email
    validates_uniqueness_of :email
  
    before_create :generate_confirmation_token
  
    # Public method to generate the confirmation URL
    def confirm_email_url
      # Construct the confirmation URL based on your routes
      # Example: confirm_email_url = "http://localhost:3001/confirmations/#{confirmation_token}"
      # Adjust the route to match your actual route configuration
  
      # If your React app is on a different port or domain during development, update it accordingly
      "http://localhost:3000/confirmations/#{confirmation_token}"
    end
  
    private
  
    def generate_confirmation_token
      self.confirmation_token = SecureRandom.urlsafe_base64
    end
  end
  