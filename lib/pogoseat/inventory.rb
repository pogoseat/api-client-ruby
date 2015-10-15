require_relative 'api_endpoint'

module Pogoseat
  class Inventory < ApiEndpoint 
    # Retrieve all known events for the sales channel identified by our
    # API key.
    def self.all
      response = self.get '/inventory'
      self.check_response response
      response
    end
  end
end
