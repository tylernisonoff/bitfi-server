class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    print "IM HEREEEEEEEEEEEEEEEEEE"
  end
end
