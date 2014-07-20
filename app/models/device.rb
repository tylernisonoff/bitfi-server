class Device < ActiveRecord::Base
  attr_accessible :mac_address, :user_id
end
