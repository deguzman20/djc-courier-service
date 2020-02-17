require "rails_helper"

RSpec.describe Conversation, type: :model do
  context "when field's are nil" do
    let(:conversation) { build(:conversation) }

    it "ensure presence of recipient id" do
        conversation.recipient_id = nil
        expect(conversation.save).to eq(false)
    end

    it "ensure presence of sender id" do
        conversation.sender_id = nil
        expect(conversation.save).to eq(false)
    end
  end

  describe "Association" do
    it { should have_many(:messages).dependent(:destroy) }
    it { should belong_to(:sender).class_name('User') }
    it { should belong_to(:recipient).class_name('User') }
  end

  describe "Validation" do
    it { should validate_uniqueness_of :sender_id }
  end
end