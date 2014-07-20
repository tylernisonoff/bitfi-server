class HomeController < ApplicationController
  before_filter :authenticate_user!, only: :index

  def index
    @tetherer = User.find_by_last_tether_ip(request.remote_ip)
    @connection = @tetherer.connections.pending.joins(:device)
      .where(devices: { user_id: current_user.id }).last
    if @connection.nil?
      @connection = @tetherer.connections.pending.joins(:device)
        .where('devices.user_id IS NULL').includes(:device).last
      @connection.device.user = current_user
      @connection.device.save!
    end
  end

  def log_in
    user = User.find_by_email(params[:email])
    if user and user.valid_password?(params[:password])
      user.update_attributes!(last_tether_ip: request.remote_ip)
      render status: 200, json: "Yes"
    else
      render status: 403, json: "No"
    end
  end
end
