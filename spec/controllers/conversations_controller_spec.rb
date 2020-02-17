require "rails_helper"

RSpec.describe ConversationsController, type: :controller do
  let(:conversation) {  Conversation.get(current_user.id, params[:user_id])  }

  describe "GET #create" do
    it "check instance variable for coversation if it's equal to conversation let variable" do
      post :create
    #   user = build(:user)
    #   allow(controller).to receive(:current_user).and_return(user)
      expect(user).to eq(true)
    end
  end
end