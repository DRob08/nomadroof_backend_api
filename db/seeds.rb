# db/seeds.rb

# Create property categories only if they don't exist
categories = ['House', 'Apartment', 'B & B', 'Cabin', 'Condos', 'Dorm', 'Host Family']

categories.each do |category_name|
  category = PropertyCategory.find_by(name: category_name)

  PropertyCategory.create(name: category_name) unless category
end

# Find the user with the specified email or create one if not found
user = User.find_by(email: 'hello@mangovice.com') || User.create(
  email: 'hello@mangovice.com',
  password: SecureRandom.hex, # Use a secure method for generating passwords
  # Add other user attributes as needed
)

# Find the category with the specified name or create one if not found
category = PropertyCategory.find_or_create_by(name: 'Apartment')

# Create a property
property = Property.create(
  user: user,
  name: 'Cozy Apartment',
  description: 'A comfortable and cozy apartment',
  latitude: 37.7749, # Replace with actual latitude
  longitude: -122.4194, # Replace with actual longitude
  features_and_amenities: ['Wi-Fi', 'Kitchen', 'TV'], # Consider storing in a separate table if needed
  max_guests: 4,
  availability: true,
  monthly_price: 1500.00,
  weekly_price: 500.00,
  daily_price: 100.00,
  status: 'Available',
  booked_start_date: nil,
  booked_end_date: nil,
  cat_property: category
)

puts 'Seed data created successfully.'
