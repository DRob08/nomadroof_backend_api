class User < ApplicationRecord
    has_secure_password
  
    enum role: { student: 0, admin: 1, host: 2 }
  
    validates_presence_of :email
    validates_uniqueness_of :email
  
    before_create :generate_confirmation_token

      # Add these fields for profile editing
    validates_presence_of :first_name, :last_name
    validates :whatsapp_number, presence: true, if: -> { whatsapp_number_changed? }
    validates :languages_spoken, presence: true, if: -> { languages_spoken_changed? }
    validates :about_me, presence: true, if: -> { about_me_changed? }
    validates :dob, presence: true, if: -> { dob_changed? }
    validates :instagram_handle, presence: true, if: -> { instagram_handle_changed? }
    validates :twitter_handle, presence: true, if: -> { twitter_handle_changed? }
    validates :linkedin_handle, presence: true, if: -> { linkedin_handle_changed? }

    before_save :strip_whitespace
  
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
  
    def strip_whitespace
      # Strip leading and trailing whitespaces from text fields
      self.first_name.strip! if first_name.present?
      self.last_name.strip! if last_name.present?
      self.languages_spoken.strip! if languages_spoken.present?
      self.about_me.strip! if about_me.present?
      self.instagram_handle.strip! if instagram_handle.present?
      self.twitter_handle.strip! if twitter_handle.present?
      self.linkedin_handle.strip! if linkedin_handle.present?
    end
  end
  