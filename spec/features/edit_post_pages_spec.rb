require 'rails_helper'

describe "edit a post process" do
  it "edits a post title" do
    user = FactoryGirl.create(:admin)
    sign_in(user)
    post = FactoryGirl.create(:post)
    post.update(:user_id => user.id)
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'EPICODUS'
    click_on 'Update Post'
    expect(page).to have_content 'EPICODUS'
  end

    it "edits a post blog" do
      user = FactoryGirl.create(:admin)
      sign_in(user)
      post = FactoryGirl.create(:post)
      post.update(:user_id => user.id)
      visit post_path(post)
      click_on 'Edit'
      fill_in 'Blog', :with => 'Glad I attended'
      click_on 'Update Post'
      expect(page).to have_content 'Glad I attended'
    end
end
