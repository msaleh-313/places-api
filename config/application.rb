require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TouristsPlaces
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

                              
    
                              #step 6 continue
                              
                              
  #This line tells Rails to store session data in cookies 
  #and sets a name for the session cookie called "_interslice_session".    
  #The key: "_interslice_session" part gives a unique name to the session cookie.
  # This prevents conflicts with other cookies that might be set by other apps or parts of your site.
    config.session_store :cookie_store ,key: "_interslice_session"


  #This line adds cookie support to the Rails app by including ActionDispatch::Cookies in the middleware stack.
  #When a request comes in,this middleware checks if there is a cookie from the user’s browser.If the cookie is there,
  #the middleware reads it, and your Rails app can access the session data stored in the cookie.
    config.middleware.use ActionDispatch::Cookies

  # This line applies the session store configuration (set in the first line) to the middleware stack. 
  # This enables Rails to manage user sessions using cookies.
  # It ensures that the cookie store (which stores session data in cookies) is actually used when processing requests. 
  # Without this, the session data would not be saved in cookies properly.
  # This ties together the session store settings and the middleware that handles each request.
  # It ensures that the session data (like a JWT token) is correctly saved in cookies and sent back to the server 
  # whenever the user makes a request.


    config.middleware.use config.session_store ,config.session_options 


  end
end
