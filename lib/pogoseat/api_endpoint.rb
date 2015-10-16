module Pogoseat
  class ApiEndpoint
    include HTTParty
    base_uri Pogoseat::API_BASE_URL
    basic_auth ENV["POGOSEAT_API_KEY"], ENV["POGOSEAT_API_SECRET"]
    format :json

    # A helper function to verify that the API response appears successful.
    def self.check_response response
      if response.code != 200
        raise "API authentication failed"
      end
    end

    protected
    # Sets each member of the opts hash as an instance variable.
    def set_instance_variables opts
      opts.each do |k,v|
        begin
          instance_variable_set "@#{k}", v

          # Sets the accessor for the property as well
          eigenclass = class<<self; self; end
          eigenclass.class_eval do
            attr_accessor k
          end
        rescue NameError => e
          # We'll just eat the error for now
        end
      end
    end
  end
end
