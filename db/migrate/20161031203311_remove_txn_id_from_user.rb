class RemoveTxnIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :txn_id
  end
end
