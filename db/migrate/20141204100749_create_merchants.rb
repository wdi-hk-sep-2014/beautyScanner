class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :location
      t.string :phone
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
