class AddFieldsToModels < ActiveRecord::Migration
  def change
    add_column :connections, :terminated_at, :datetime
    add_column :users, :last_tether_ip, :string
  end
end
