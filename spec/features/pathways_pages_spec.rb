require 'rails_helper'

  describe "the redirect to another pathway process", :vcr => true do
    it "redirects to the post page" do
      admin = FactoryGirl.create(:admin)
      sign_in(admin)
      post = FactoryGirl.create(:post)
      post.update(:user_id => admin.id)
      comment = Comment.create(:comment => "I agree", :post_id => post.id, :user_id => admin.id)
      visit post_path(comment.post_id)
      click_on 'Edit comment'
      click_on 'Cancel: Back to Post'
      expect(page).to have_content comment.comment
    end
    it "redirects to the home page when clicked on navbar" do
      post = FactoryGirl.create(:post)
      visit post_path(post)
      click_on "My Blog"
      expect(page).to have_content "Welcome"
    end

  end
