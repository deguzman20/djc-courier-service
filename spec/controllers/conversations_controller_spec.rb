require "rails_helper"

RSpec.describe ConversationsController, type: :controller do
  let(:conversations_controller) { described_class.new }

  describe "GET #create" do
    it "check instance variable for coversation if it's equal to conversation let variable" do
      # conversation = Conversation.new
      # allow(conversation).to receive(:current_user).and_return(1)
      # allow(conversation).to receive(params).and_return(params: { id: 2 })
      # expect(conversations_controller.create).to eq(1)
    end
  end
end
