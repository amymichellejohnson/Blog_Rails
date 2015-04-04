require 'rails_helper'

describe "the add a comment process", :vcr => true  do
  it "adds a new comment if signed in" do
    admin = FactoryGirl.create(:admin)
    sign_in(admin)
    post = FactoryGirl.create(:post)
    post.update(:user_id => admin.id)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Comment', :with => 'I agree!'
    click_on 'Create Comment'
    expect(page).to have_content 'I agree'

  end


  it "gives error when no comment is entered" do
    admin = FactoryGirl.create(:admin)
    sign_in(admin)
    post = FactoryGirl.create(:post)
    post.update(:user_id => admin.id)
    visit post_path(post)
    click_on 'Comment'
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end


  it "displays the comment with the comment creator's name and comment" do
    admin = FactoryGirl.create(:admin)
    post = FactoryGirl.create(:post)
    post.update(:user_id => admin.id)
    sign_in(admin)
    comment = Comment.create(:comment => "I agree", :post_id => post.id, :user_id => admin.id)
    visit post_path(post)
    expect(page).to have_content admin.name
    expect(page).to have_content comment.comment
  end

  it "Asks users to sign in before they can create a comment" do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    expect(page).to have_content "Please sign in to comment"
  end



  it "adds a new comment if signed in in JS", js:true do
    admin = FactoryGirl.create(:admin)
    sign_in(admin)
    post = FactoryGirl.create(:post)
    post.update({:user_id => admin.id})
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Comment', :with => 'I agree!'
    click_on 'Create Comment'
    expect(page).to have_content 'I agree'

  end


  it "gives error when no comment is entered in JS", js:true do
    admin = FactoryGirl.create(:admin)
    sign_in(admin)
    post = FactoryGirl.create(:post)
    post.update({:user_id => admin.id})
    visit post_path(post)
    click_on 'Comment'
    click_on 'Create Comment'
    expect(page).to have_content 'Please fill form completely'
  end


  it "displays the comment with the comment creator's name and comment in JS", js:true do
    admin = FactoryGirl.create(:admin)
    sign_in(admin)
    post = FactoryGirl.create(:post)
    post.update(:user_id => admin.id)
    comment = Comment.create(:comment => "I agree", :post_id => post.id, :user_id => admin.id)
    visit post_path(comment.post_id)
    expect(page).to have_content admin.name
    expect(page).to have_content comment.comment
  end
end
