class HomeController < ApplicationController


  def index

  end

  def accept
    if ! user_signed_in?
      if !params[:mac_address] 
        redirect_to sorry_url
      end
      redirect_to new_user_session_path(mac_address: params[:mac_address], 
                                          tetherer_id: params[:tetherer_id])
    end
  end

  def sorry
  end

  def log_in
    email = params[:email]
    password = params[:password]
    if User.find_by_email(email).valid_password?(password)
      render status: 200, json: "Yes"
    else
      render status: 403, json: "No"
    end
  end
end
