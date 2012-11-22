# Load the rails application
require File.expand_path('../application', __FILE__)

# force Rails into production mode when # you don't control web/app server and can't set it the proper way 
#ENV['RAILS_ENV'] ||= 'production'

#Time::DATE_FORMATS[:post] = "Postado em %b, %m %Y - %I:%M%p"

# Initialize the rails application
Portaldevgex::Application.initialize!

Time::DATE_FORMATS[:post] = "postado em %d %b %Y - %H:%M"