class MakeConnectionTable < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :device_id
      t.integer :tetherer_id
      t.integer :data_usage
      t.boolean :active

      t.timestamps
    end
  end
end
