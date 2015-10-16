require 'spec_helper'

describe Pogoseat::Inventory do
  describe "#all" do
    it "should not list any inventory when none exists" do
      inventory_list = Pogoseat::Inventory.all
      expect(inventory_list.length).to eq(0)
    end

    it "should return inventory as InventoryItems when inventory exists" do
      # First, create an inventory item
      inventory_property = { "title" => "Test Title", "price" => 5 }
      new_item = Pogoseat::InventoryItem.new inventory_property
      new_item.save!

      # Now, fetch inventory...
      inventory_items = Pogoseat::Inventory.all
      expect(inventory_items.count).to eq(1)
      expect(inventory_items[0]).to be_a Pogoseat::InventoryItem
      expect(inventory_items[0].title).to eq("Test Title")
      
      # Let's do some cleanup and delete our inventory item
      new_item.delete!
    end
  end
end
