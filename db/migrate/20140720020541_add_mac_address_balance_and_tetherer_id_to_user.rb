class AddMacAddressBalanceAndTethererIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :mac_address, :string
    add_column :users, :balance, :float
    add_column :users, :tetherer_id, :string
  end
end
