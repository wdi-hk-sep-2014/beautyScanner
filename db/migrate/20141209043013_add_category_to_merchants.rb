class AddCategoryToMerchants < ActiveRecord::Migration
  def change
    add_reference :merchants, :category, index: true
  end
end
