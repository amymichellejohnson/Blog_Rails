require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Your name', :with => 'Me'
    fill_in 'Comment', :with => 'I agree!'
    click_on 'Create Comment'
    expect(page).to have_content 'I agree'
    expect(page).to have_content 'added'

  end



  it "gives error when no comment is entered" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment'
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end
