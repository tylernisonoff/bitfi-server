class HomeController < ApplicationController

  before_filter :mac_address, :except => [:sorry]
  def index
  end

  def sorry
  end

  def mac_address
    if ! params[:mac] 
      puts "param: #{params[:mac]}"
      redirect_to sorry_url
    end
  end

end
