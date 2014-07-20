class CreateTetherers < ActiveRecord::Migration
  def change
    create_table :tetherers do |t|
      t.string :mac_address
      t.float :data_available

      t.timestamps
    end
  end
end
