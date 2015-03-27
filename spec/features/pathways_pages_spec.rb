require 'rails_helper'

  describe "the redirect to another pathway process" do
    it "redirects to the post page" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      comment = FactoryGirl.create(:comment)
      comment.update(:user_id => user.id)
      visit post_path(comment.post_id)
      click_on 'Edit comment'
      click_on 'Cancel: Back to Post'
      expect(page).to have_content comment.comment
    end
  end
