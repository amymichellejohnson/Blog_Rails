require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment if signed in" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post)
    post.update(:user_id => user.id)
    visit post_path(post)
    click_on 'Comment'
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


  it "displays the comment with the comment creator's name and comment" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment)
    comment.update(:user_id => user.id)
    visit post_path(comment.post_id)
    expect(page).to have_content user.name
    expect(page).to have_content comment.comment
  end

  it "Asks users to sign in before they can create a comment" do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "Comment"
    expect(page).to have_content "sign in"
  end
end
describe "the add a comment process with JS" do
  it "adds a new comment if signed in", js:true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post)
    post.update(:user_id => user.id)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Comment', :with => 'I agree!'
    click_on 'Create Comment'
    expect(page).to have_content 'I agree'
    expect(page).to have_content 'added'

  end


  it "gives error when no comment is entered", js:true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment'
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end


  it "displays the comment with the comment creator's name and comment", js:true do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment)
    comment.update(:user_id => user.id)
    visit post_path(comment.post_id)
    expect(page).to have_content user.name
    expect(page).to have_content comment.comment
  end

  it "Asks users to sign in before they can create a comment", js:true do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "Comment"
    expect(page).to have_content "sign in"
  end
end
