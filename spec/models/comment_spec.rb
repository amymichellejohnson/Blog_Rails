require 'rails_helper'

describe Comment, :vcr => true do
  it { should validate_presence_of :comment }
  it { should belong_to :post }
  it { should belong_to :user }


  it "doesn't save the message if twilio gives an error" do
    user = User.create({:telephone => 555, :name => "Amy", :email=>"amy@amy.com", :password => "12345678"})
    post = FactoryGirl.create(:post)
    post.update({:user_id => user.id })
    comment = Comment.create(:comment =>"hi", :user_id => user.id, :post_id => post.id)
    expect(comment.save).to eq(false)
  end

  it "adds an error if the number is invalid" do
    user = User.create({:telephone => 555, :name => "Amy", :email=>"amy@amy.com", :password => "12345678"})
    post = FactoryGirl.create(:post)
    post.update({:user_id => user.id })
    comment = Comment.create(:comment =>"hi", :user_id => user.id, :post_id => post.id)
    comment.save
    expect(comment.errors.comments[:base]).to eq ["The 'To' number 555 is not a valid phone number."]
  end
end
