class HomeController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  def map ;end

  def map_coordinates
    coordinates = User.all

    render json: coordinates
  end
end
