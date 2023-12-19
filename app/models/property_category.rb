# app/models/property_category.rb

class PropertyCategory < ApplicationRecord
    has_many :properties, foreign_key: 'cat_property_id'
  
    # Add any validations or methods specific to the PropertyCategory model
  end
  