class UsersController < ApplicationController
  respond_to :json

  def connected_devices
    @user = User.find(params[:id])
    @macs = @user.connected_devices.map(&:mac_address)
    respond_with @macs
  end
end
