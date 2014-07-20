class HomeController < ApplicationController
  before_filter :authenticate_user!, only: :index

  def index
    @tetherer = User.find_by_last_tether_ip(request.remote_ip)
    @connection = @tetherer.connections.pending.joins(:device)
      .where(device: { user_id: current_user.id }).last
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
      if request.ip != ENV['CLIENT_IP']
        current_user.update_attribute!(last_tether_ip: request.remote_ip)
      end
      render status: 200, json: "Yes"
    else
      render status: 403, json: "No"
    end
  end
end
