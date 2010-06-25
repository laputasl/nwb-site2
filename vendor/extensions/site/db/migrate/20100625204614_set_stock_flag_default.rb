class SetStockFlagDefault < ActiveRecord::Migration
  def self.up
    Product.update_all ["stock_availability = ?", "in_stock"] 
  end

  def self.down
  end
end