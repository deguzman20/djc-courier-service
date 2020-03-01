# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#

require "rails_helper"

RSpec.describe Message, type: :model do
  context "when field's are nil" do
    let(:message) { build(:message) }

    it "ensure presence of body" do
      message.body = nil
      expect(message.save).to eq(false)
    end

    it "ensure presence of user first name" do
      message.user.first_name = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of user last name" do
      message.user.last_name = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of user email" do
      message.user.email = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of birthdate" do
      message.user.birthdate = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of gender" do
      message.user.gender = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of mobile number" do
      message.user.mobile_number = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of plate number" do
      message.user.plate_number = nil
      expect(message.user.save).to eq(false)
    end

    it "ensure presence of password" do
      message.user.plate_number = nil
      expect(message.user.save).to eq(false)
    end
  end

  # context "when all field's are not nil" do
  #   let(:message) { build(:message) }

  #   it "will save new message" do
  #     expect(message.save).to eq(true)
  #   end
  # end

  describe "Association" do
    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to belong_to(:conversation) }
  end
end
