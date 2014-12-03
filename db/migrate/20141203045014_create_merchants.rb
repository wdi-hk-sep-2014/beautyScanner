class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :category
      t.string :name
      t.string :location
      t.integer :phone
      t.string :website
      t.string :email
      t.text :address

      t.timestamps null: false
    end
  end
end
