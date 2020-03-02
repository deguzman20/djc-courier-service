# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default("false")
#  age                    :string
#  approved               :boolean          default("false")
#  birthdate              :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :string
#  image                  :string
#  is_login               :boolean          default("false")
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
#  sign_in_count          :integer          default("0"), not null
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
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :trackable
  geocoded_by :ip_address, latitude: :lat, longitude: :lon
  # after_validation :geocode

  enum gender: %i[male female]

  belongs_to :vehicle_type, optional: true
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  validates_presence_of :first_name, :last_name, :email, :birthdate, :gender, :mobile_number, :plate_number, :password, on: [:create]
end
