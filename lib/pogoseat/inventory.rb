require_relative 'api_endpoint'

module Pogoseat
  class Inventory < ApiEndpoint 
    # Retrieve all known events for the sales channel identified by our
    # API key.
    def self.all
      response = self.get '/inventory'
      self.check_response response
   
      # Instantiate each inventory item as an InventoryItem
      inventory_items = []
      response.each { |item_props|
        new_inventory_item = Pogoseat::InventoryItem.new(item_props, false)
        inventory_items.push new_inventory_item
      }
      
      return inventory_items
    end
  end
end
