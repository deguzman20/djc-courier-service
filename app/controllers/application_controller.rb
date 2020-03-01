# Based Controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    super(resource)
    #update_geolocation(resource)
    user = User.find(resource.id)
    if user.present?
      if user.approved?
        user.is_login = true
        user.save   
        stored_location_for(resource) || root_path
      else
        flash[:notice] = "Your account has not approve"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "Incorrent email and password"
      redirect_to new_user_session_path
    end
  end

  def update_geolocation(resource)
    user = User.find(resource.id)

    # Get Public Ip address
    remote_ip = open("http://whatismyip.akamai.com").read
    geolocation = Geocoder.search(remote_ip).first.coordinates
    return unless geolocation.length >= 2

    user.latitude = geolocation[0]
    user.longitude = geolocation[1]
    user.is_login = true
    user.save
  end
end
