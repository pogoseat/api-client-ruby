# api-client-ruby
Welcome to the Ruby-powered Pogoseat API client! This is a Ruby-powered client for interacting with the [Pogoseat API](https://pogoseat.com/).

## Getting Started
### Installation
Just `require 'lib/pogoseat`, which will automatically bring in everything else. It's that easy!

### Authentication
Every API operation (outside of the `ping` operation) requires the end user to be authenticated. Since it's a bad idea to store sensitive credentials in source code, we look for them in the environment in two variables: `POGOSEAT_API_KEY` and `POGOSEAT_API_SECRET`.

You can obtain your API credentials from your Pogoseat dashboard--contact Pogoseat directly if you need a hand with that.

### Using the API
#### Inventory
The basic unit of the Pogoseat API is the inventory item. `Inventory` represents a collection of inventory items. Calling a static method of `Inventory` will return an array of `InventoryItem`s, which you can then interact with. Some examples: 

```
# Include the Pogoseat API library
require 'lib/pogoseat'

# Fetch every single inventory item we know about.
Pogoseat::Inventory.all # Returns an array of InventoryItem objects
```

#### InventoryItem
An InventoryItem is the basic unit of inventory in Pogoseat. Each is required to have a `price` attribute, and anything else you'd like to provide. Some Pogoseat API applications, like the Pogoseat webapp, require additional information: contact the API application creator (or Pogoseat) to learn more about those requirements. For our examples, we'll imagine a simple implementation that requires a few other fields, like `section`, `row`, and `seat`.

```
# First, we designate what we want our seat to look like as a hash
our_seat = { "price" => 10, "section" => 100, "row" => 1, "seat" => 1 }

# Create our seat
my_seat = Pogoseat::InventoryItem.new our_seat

# Save the seat in the Pogoseat inventory database
my_seat.save!

# Update the seat
my_seat.price = 50 # Change an existing property
my_seat.color = "blue" # Or add a new propery
my_seat.save! # save! is smart, and will create or update as appropriate

# Delete the seat
my_seat.delete!
```

Naturally, you can also interact with `InventoryItem`s that are returned by other functions, like those in the `Pogoseat::Inventory` class, the same way.
