# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3001', 'https://nomadroof-front-end-app.onrender.com'

    # Allow CORS for specific resources
    resource '/registrations',
      headers: :any,
      methods: [:post], # Adjust the methods as per your API's requirements
      credentials: true   # If your frontend sends cookies or uses sessions

    # Allow CORS for all other resources ('*')
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true   # If your frontend sends cookies or uses sessions
  end
end


  