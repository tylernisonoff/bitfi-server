class ConnectionsController < ApplicationController
  respond_to :json

  def create
    @device = Device.find_by_mac_address(params[:mac_address])
    @connection = Connection.new(
      tetherer_id: params[:user_id],
      device_id: @device.id,
      active: false
    )
    @connection.save!
    head :created
  end

  def index
    @tetherer = User.find(params[:user_id])
    respond_with @tetherer.connections.includes(:device).active
  end

  def activate
    @connection = Connection.find(params[:connection_id])
    @connection.update_attribute!(:active, true)
    redirect_to 'google.com'
  end
end
