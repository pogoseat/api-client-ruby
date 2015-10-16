# This is an example script that will query the Pogoseat IPA for all
# stored inventory and remove it.

# Include the Pogoseat API client
require_relative '../lib/pogoseat'

# Fetch all inventory items
my_inventory = Pogoseat::Inventory.all

# Remove each inventory item
my_inventory.each { |item|
  item.delete!
}
