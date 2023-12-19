# Assuming the migration file name is: 20231215202249_add_category_to_properties.rb

class AddCategoryToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :cat_property, foreign_key: { to_table: :property_categories }
  end
end
