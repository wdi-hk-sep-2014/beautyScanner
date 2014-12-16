class RemoveLocationFromMerchant < ActiveRecord::Migration
  def change
    remove_column :merchants, :location, :string
  end
end
