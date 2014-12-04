class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :category
      t.string :location
      t.integer :phone
      t.string :website
      t.string :email

      t.timestamps null: false
    end
  end
end
