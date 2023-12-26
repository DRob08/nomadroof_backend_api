# db/migrate/2023xxxxxxxxxx_add_columns_to_properties.rb
class AddColumnsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :extra_price_per_guest, :decimal, default: 0.00
    add_column :properties, :size, :integer, default: 0
    add_column :properties, :bedrooms, :integer, default: 0
    add_column :properties, :bathrooms, :integer, default: 0
    add_column :properties, :rooms, :integer, default: 0
    add_column :properties, :city_fee, :decimal, default: 0.00
    add_column :properties, :cleaning_fee, :decimal, default: 0.00
    add_column :properties, :verified, :boolean, default: false
    add_column :properties, :country, :string
    add_column :properties, :city, :string
    add_column :properties, :about_neighborhood, :text
    add_column :properties, :min_booking_months, :integer, default: 0
    add_column :properties, :check_in_hour, :time, default: '12:00:00'
    add_column :properties, :check_out_hour, :time, default: '12:00:00'
    # Add any other columns you find appropriate
  end
end
