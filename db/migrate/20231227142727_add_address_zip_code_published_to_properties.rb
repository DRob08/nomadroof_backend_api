class AddAddressZipCodePublishedToProperties < ActiveRecord::Migration[7.0]
    def change
      add_column :properties, :property_address, :string
      add_column :properties, :zip_code, :string
      add_column :properties, :published, :boolean, default: false
    end
  end
  