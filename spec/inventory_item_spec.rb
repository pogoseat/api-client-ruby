require 'spec_helper'

describe Pogoseat::InventoryItem do
  describe "creation" do
    it "should allow me to create and manipulate an inventory item via accessors" do
      item_properties = { "price" => 5, "title" => "test" }
      new_item = Pogoseat::InventoryItem.new item_properties
      expect(new_item.title).to be == "test"

      new_item.title = "Hello"
      expect(new_item.title).to be == "Hello"
    end

    it "should allow me to save new inventory items" do
      item_properties = { "price" => 5, "title" => "A Test Inventory Item" }
      new_item = Pogoseat::InventoryItem.new item_properties
      new_item.save!
      
      expect(new_item.uuid).not_to be_nil

      # Clean up! Let's delete this inventory item...
      new_item.delete!
    end
  end

  describe "deletion" do
    it "should allow me to delete inventory items" do
      starting_inv_count = Pogoseat::Inventory.all.length
      
      inventory_properties = { "price" => 5, "title" => "Test" }
      new_item = Pogoseat::InventoryItem.new inventory_properties 
      new_item.save!

      expect(Pogoseat::Inventory.all.length).to eq( starting_inv_count + 1 )

      new_item.delete!
      expect(Pogoseat::Inventory.all.length).to eq( starting_inv_count )
    end
  end
end
