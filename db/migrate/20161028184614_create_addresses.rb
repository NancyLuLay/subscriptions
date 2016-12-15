class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country
      t.string :phone
    
      t.timestamps null: false
    end
  end
end
