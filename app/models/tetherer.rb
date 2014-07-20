class Tetherer < ActiveRecord::Base
  attr_accessible :data_available, :mac_address
  has_many :users
end
