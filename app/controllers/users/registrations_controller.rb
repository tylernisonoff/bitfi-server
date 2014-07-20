class Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(params[:user])
    puts @user
    @device = Device.find_or_create_by_mac_address(params[:mac_address])
    @device.update_attributes(user_id: @user.id)
    @device.save
    puts @device.mac_address
    redirect_to sorry_path
  end
end
