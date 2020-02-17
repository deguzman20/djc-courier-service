# == Schema Information
#
# Table name: vehicle_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
class VehicleType < ApplicationRecord
  has_many :user

  validates :name, presence: true
end
