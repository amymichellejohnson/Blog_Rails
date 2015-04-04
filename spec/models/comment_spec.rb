require 'rails_helper'

describe Comment, :vcr => true do
  it { should validate_presence_of :comment }
  it { should belong_to :post }
  it { should belong_to :user }


  # it "doesn't save the message if twilio gives an error" do
  #   admin = FactoryGirl.create(:admin)
  #   post = FactoryGirl.create(:post)
  #   post.update({:user_id => admin.id })
  #   comment = Comment.create(:comment =>"hi", :user_id => admin.id, :post_id =>post.id)
  #   expect(message.save).to eq(false)
  # end
  #
  # it "adds an error if the number is invalid" do
  #   comment = Comment.create(:comment => "I agree", :post_id => post.id, :user_id => admin.id)
  #   comment.save
  #   expect(message.errors.messages[:base]).to eq ["The 'To' number 1111111 is not a valid phone number."]
  # end
end
