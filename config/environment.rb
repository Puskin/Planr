# Load the rails application
require File.expand_path('../application', __FILE__)      

Paperclip.options[:command_path] = '/usr/local/bin/'      

# Initialize the rails application
Planr::Application.initialize!
