# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  age                    :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :string
#  image                  :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  latitude               :float
#  longitude              :float
#  mobile_number          :string
#  plate_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  vehicle_type_id        :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :current_user

  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
  geocoded_by :ip_address, latitude: :lat, longitude: :lon
  # after_validation :geocode

  belongs_to :vehicle_type, optional: true
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  def initialize(current_user)
    @current_user = current_user
  end

  def self.update_geolocation_of_specific_user
    self.update_user(@current_user)
  end

  def update_user(current_user)
    @user = self.find(current_user)
    remote_ip = open('http://whatismyip.akamai.com').read
    geolocation = Geocoder.search(remote_ip).first.coordinates
    if geolocation.length >=2
      @user.latitude = 1234
      @user.longitude = 5678
      @user.save
    end
  end
end
