class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :balance, 
                  :mac_address, :tetherer_id, :encrypted_password
  belongs_to :tetherer, class_name: "User", foreign_key: "tetherer_id"
  # attr_accessible :title, :body
end
