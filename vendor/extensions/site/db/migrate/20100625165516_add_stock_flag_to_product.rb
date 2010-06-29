class AddStockFlagToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :stock_availability, :string
  end

  def self.down
    remove_column :products, :stock_availability
  end
end