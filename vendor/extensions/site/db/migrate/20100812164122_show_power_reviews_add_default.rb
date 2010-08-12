class ShowPowerReviewsAddDefault < ActiveRecord::Migration
  def self.up
    change_column :products, :show_powerreviews, :boolean, :default => 1
  end

  def self.down
    change_column :products, :show_powerreviews, :boolean, :default => nil
  end
end