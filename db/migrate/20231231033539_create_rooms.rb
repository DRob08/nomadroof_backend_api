class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.bigint :property_id, null: false
      t.integer :bedroom_number, null: false
      t.string :room_type
      t.integer :occupancy
      t.decimal :room_size
      t.boolean :ensuite_bathroom
      t.text :description
      t.boolean :accessible
      t.decimal :nightly_price
      t.decimal :monthly_price
      t.json :images
      t.boolean :available, default: true
      t.boolean :booked, default: false
      t.date :check_in_date
      t.date :check_out_date
      t.integer :bed_type
      # Add other room-specific columns as needed
      t.timestamps
   

    end

    add_foreign_key :rooms, :properties
    add_index :rooms, [:property_id, :bedroom_number], unique: true
  end
end
