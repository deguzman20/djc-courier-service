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

FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "user-#{n}@example.com" }
    birthdate { DateTime.now }
    gender { %w[male female].sample }
    mobile_number { "09495939582" }
    plate_number { "ABC-1234" }
    password { "deguzman123" }
    association :vehicle_type, factory: :type_of_vehicle,
                               strategy: :build

    # trait :user_messages do |user, evaluator|
    #   transient do
    #     user_messages_count { 6 }
    #   end
    # end
  end

  factory :type_of_vehicle, class: "VehicleType" do
    name { "SUV" }
  end
end
