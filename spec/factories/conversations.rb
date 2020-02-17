# == Schema Information
#
# Table name: conversations
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
# Indexes
#
#  index_conversations_on_recipient_id                (recipient_id)
#  index_conversations_on_recipient_id_and_sender_id  (recipient_id,sender_id) UNIQUE
#  index_conversations_on_sender_id                   (sender_id)
#

FactoryBot.define do
  factory :conversation do
    id { 1 }
    recipient_id { 1 }
    sender_id { 1 }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
