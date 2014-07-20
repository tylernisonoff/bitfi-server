class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect

  def redirect
    if request.host != '54.210.58.4'
      redirect_to "http://54.210.58.4"
      return
    end
  end
end
