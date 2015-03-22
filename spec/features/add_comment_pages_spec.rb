require 'rails_helper'
describe "the add a comment process" do
  it "adds a new comment" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Your name', :with => 'Me'
    fill_in 'Comment', :with => 'I agree!'
    click_on 'Create Comment'
    expect(page).to have_content 'I agree'
  end

  it "gives error when no name is entered" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Comment', :with => 'I agree'
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end


  it "gives error when no comment is entered" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Your name', :with => 'Me'
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end
