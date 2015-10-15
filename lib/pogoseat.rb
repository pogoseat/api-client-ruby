#############################
# Pogoseat API Client
#
# @copyright 2015 Pogoseat <eng@pogoseat.com>
############################

require "httparty"

# Define some global constants that govern the operation
# of our platform
module Pogoseat
  # Specify the URL of the production API
  API_URL = "https://api.pogoseat.com/".freeze

  # Specify the version of the API we're implementing
  API_VERSION = "1".freeze

  # Glue everything together to arrive at the URL we'll be calling...
  API_BASE_URL = "#{Pogoseat::API_URL}#{Pogoseat::API_VERSION}"
end

# We'll automatically include all of our individual
# class implementations here, to make the developer
# experience a little more comfortable.
Dir[File.dirname(__FILE__) + '/pogoseat/*.rb'].each do |file|
    require file
end
