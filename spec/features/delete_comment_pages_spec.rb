require 'rails_helper'

describe "delete a comment process", :vcr => true do
  it "deletes a comment" do
    admin = FactoryGirl.create(:admin)
    sign_in(admin)
    post = FactoryGirl.create(:post)
    post.update(:user_id => admin.id)
    comment = Comment.create(:comment => "I agree", :post_id => post.id, :user_id => admin.id)
    visit post_path(comment.post_id)
    click_on 'Delete comment'
    expect(page).to have_content 'deleted'
  end
end
