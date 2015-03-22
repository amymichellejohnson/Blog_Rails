require 'rails_helper'

  describe "return to main page process" do
    it "redirects to the main page" do
      visit posts_path
      click_on 'Create a New Post'
      click_on 'Return to Main Page'
      expect(page).to have_content 'Welcome'
    end

    it "redirects to the main page" do
      Post.create(:title => "Epicodus", :blog => "So happy I attended")
      visit posts_path
      click_on 'Epicodus'
      click_on 'Return to Main Page'
      expect(page).to have_content 'Welcome'
    end
  end

  describe "return to post page process" do
    it "redirects to the post page" do
      post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
      visit post_path(post)
      click_on 'Edit entry'
      click_on 'Return to Main Page'
      expect(page).to have_content 'Welcome'
    end

    it "redirects to the post page" do
      post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
      comment = Comment.create(:name => "Nancy", :comment => "I agree", :post_id => 1 )
      visit post_path(post)
      click_on 'Edit comment'
      click_on 'Cancel: Back to Post'
      expect(page).to have_content 'So happy I attended'
    end
  end
