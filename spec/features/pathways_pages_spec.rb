require 'rails_helper'

    it "redirects to the post page" do
      post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
      comment = Comment.create(:name => "Nancy", :comment => "I agree", :post_id => 1 )
      visit post_path(post)
      click_on 'Edit comment'
      click_on 'Cancel: Back to Post'
      expect(page).to have_content 'So happy I attended'
    end
  end
