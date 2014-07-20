class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect

  def redirect
    if request != 'localhost'
      redirect_to "http://54.210.58.4"
      return
    end
  end
end
