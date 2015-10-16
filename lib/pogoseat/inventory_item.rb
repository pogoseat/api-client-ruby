require_relative 'api_endpoint'

module Pogoseat
  class InventoryItem < ApiEndpoint
    # Create a new InventoryItem instance with the specified properties.
    # If create_new is specified, and true, we'll treat this like a new item.
    # Otherwise, we'll treat it as if we're updating an existing item.
    def initialize( properties, create_new = true )
      # Properly set the is_new parameter based on what we say
      @is_new = create_new
      
      # Set instance variables according to the passed properties.
      set_instance_variables properties
    end

    # Saves the current inventory item to the API.
    # This will update an existing inventory item, or create a new one, as appropriate.
    def save!
      savable_properties = Hash[instance_variables.map { |name| 
        # We need to remove the first character (@) of each name to be correct
        clean_name = name.to_s; 
        clean_name[0] = ''; 
        [clean_name, instance_variable_get(name)] 
      } ]
      # Remove the "is_new" property, which is only used internally.
      savable_properties.delete("is_new")

      if @is_new
        response = self.class.post '/inventory', :body => savable_properties
        self.class.check_response response
        if defined? response['status'] and response['status'] == 'error'
          throw response['message']
        end
        set_instance_variables response
        @is_new = false
        return true 
      else
        throw "Updating isn't implemented, yet..."
      end
    end

    # Deletes the current inventory item. This operation is only defined
    # if the inventory item exists on the API.
    def delete!
      if @is_new 
        throw "Only existing inventory items can be deleted."
      else
        response = self.class.delete "/inventory/#{@uuid}"
        if response['success'] != true
          throw "Delete failed!"
        end
        return true
      end
    end
  end
end
