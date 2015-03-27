require 'rails_helper'

describe "edit a comment process" do

    it "edits a comment comment" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      comment = FactoryGirl.create(:comment)
      comment.update(:user_id => user.id)
      visit post_path(comment.post_id)
      click_on 'Edit comment'
      fill_in 'Comment', :with => 'Yes!'
      click_on 'Update Comment'
      expect(page).to have_content 'edited'
    end
end
