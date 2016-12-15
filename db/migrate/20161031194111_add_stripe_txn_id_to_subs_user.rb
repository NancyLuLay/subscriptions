class AddStripeTxnIdToSubsUser < ActiveRecord::Migration
  def change
    add_column :subscription_users, :stripe_txn_id, :string
  end
end
