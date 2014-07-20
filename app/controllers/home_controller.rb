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

end
