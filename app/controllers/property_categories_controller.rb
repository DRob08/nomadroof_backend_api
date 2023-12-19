class PropertyCategoriesController < ApplicationController
    # Other actions...
  
    def index
      @categories = PropertyCategory.all
      render json: @categories
    end
  end
  