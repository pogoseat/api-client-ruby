require 'spec_helper'

describe Pogoseat::Inventory do
  describe "#all" do
    it "should not list any inventory when none exists" do
      inventory_list = Pogoseat::Inventory.all
      inventory_list.empty?
    end
  end
end
