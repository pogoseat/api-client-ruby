module Pogoseat
  class ApiEndpoint
    include HTTParty
    base_uri Pogoseat::API_BASE_URL
    basic_auth ENV["POGOSEAT_API_KEY"], ENV["POGOSEAT_API_SECRET"]

    def self.check_response response
      if response.code != 200
        raise "API authentication failed"
      end
    end
  end
end
