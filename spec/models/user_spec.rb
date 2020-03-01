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

require "rails_helper"

RSpec.describe User, type: :model do
  context "when field's are nil" do
    let(:user) { build(:user) }

    it "ensure presence of first_name" do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of last_name" do
      user.last_name = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of email" do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of birthdate" do
      user.birthdate = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of gender" do
      user.gender = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of mobile number" do
      user.mobile_number = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of plate number" do
      user.plate_number = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of password" do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of type of vehicle" do
      user.vehicle_type.name = nil
      expect(user.vehicle_type.save).to eq(false)
    end
  end

  context "when all field's are not nil" do
    let(:user) { build(:user) }

    it "will save new user" do
      user.password = "deguzman123"
      expect(user.save).to eq(true)
    end
  end

  describe "Associations" do
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:conversations) }
    it { is_expected.to belong_to(:vehicle_type) }
  end
end
