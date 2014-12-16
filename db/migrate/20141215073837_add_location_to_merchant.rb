class AddLocationToMerchant < ActiveRecord::Migration
  def change
    add_reference :merchants, :location, index: true
  end
end
