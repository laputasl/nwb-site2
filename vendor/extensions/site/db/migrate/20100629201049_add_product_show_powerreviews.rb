class AddProductShowPowerreviews < ActiveRecord::Migration
  def self.up
    add_column :products, :show_powerreviews, :boolean
    Product.update_all ["show_powerreviews = ?", true] 
  end

  def self.down
    remove_column :products, :show_powerreviews
  end
end