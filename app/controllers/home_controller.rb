# Home Controller
class HomeController < ApplicationController
  def chat
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user).where(approved: true)
    @conversations = Conversation.includes(:recipient, :messages)
                                  .find(session[:conversations])
  end

  def map; end

  def map_coordinates
    coordinates = User.where(is_login: true)

    render json: coordinates
  end

  def my_coordinate
    return unless user_signed_in?

    user = User.find(current_user.id)

    render json: { latitude: user.latitude,
                    longitude: user.longitude,
                    first_name: user.first_name,
                    last_name: user.last_name,
                    image: user.image.to_s,
                    id: user.id  }
  end

  def update_geolocation
    return unless user_signed_in?

    user = User.find(current_user.id)
    # Get Public Ip address
    remote_ip = open("http://whatismyip.akamai.com").read
    geolocation = Geocoder.search(remote_ip).first.coordinates

    return unless geolocation.length >= 2

    user.latitude = params[:latitude]
    user.longitude = params[:longitude]
    user.save
    render json: { long: user.longitude, lat: user.latitude }
  end
end
