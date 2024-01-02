# app/models/property.rb

class Property < ApplicationRecord
    belongs_to :user
    belongs_to :cat_property, class_name: 'PropertyCategory', foreign_key: 'cat_property_id', optional: true

    has_many :rooms, dependent: :destroy

    validates :name, uniqueness: true
    validates :description, presence: true
  
    # Add any validations or methods specific to the Property model
  end
  