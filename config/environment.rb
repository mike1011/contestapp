# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Shopease::Application.initialize!

MAX_CONTESTS_PER_MONTH = ENV["MAX_CONTESTS_PER_MONTH"] || 3