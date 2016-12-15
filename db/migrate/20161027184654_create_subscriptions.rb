class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
