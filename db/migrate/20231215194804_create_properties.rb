class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.integer :max_guests
      t.boolean :availability
      t.decimal :monthly_price
      t.decimal :weekly_price
      t.decimal :daily_price
      t.string :status
      t.date :booked_start_date
      t.date :booked_end_date

      t.timestamps
    end
  end
end
