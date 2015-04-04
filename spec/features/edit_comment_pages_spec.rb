require 'rails_helper'

describe "edit a comment process", :vcr => true do

    it "edits a comment comment" do
      admin = FactoryGirl.create(:admin)
      sign_in(admin)
      post = FactoryGirl.create(:post)
      post.update(:user_id => admin.id)
      comment = Comment.create(:comment => "I agree", :post_id => post.id, :user_id => admin.id)
      visit post_path(comment.post_id)
      click_on 'Edit comment'
      fill_in 'Comment', :with => 'Yes!'
      click_on 'Update Comment'
      expect(page).to have_content 'edited'
    end
end
