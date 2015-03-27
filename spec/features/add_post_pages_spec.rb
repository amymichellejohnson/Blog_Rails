require 'rails_helper'

describe "the add a post process" do
  it "adds a new post if you are the admin" do
    user = FactoryGirl.create(:admin)
    sign_in(user)
    visit posts_path
    click_on 'Create a New Post'
    fill_in 'Title', :with => 'Animals'
    fill_in 'Blog', :with => 'I met so many new animals today.  It was great!'
    click_on 'Create Post'
    expect(page).to have_content 'Animals'
    expect(page).to have_content 'added'
  end

  it "gives error when no name is entered" do
    user = FactoryGirl.create(:admin)
    sign_in(user)
    visit posts_path
    click_on 'Create a New Post'
    fill_in 'Blog', :with => 'I met so many new animals today.  It was great!'
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end


  it "gives error when no blog is entered" do
    user = FactoryGirl.create(:admin)
    sign_in(user)
    visit posts_path
    click_on 'Create a New Post'
    fill_in 'Title', :with => 'Muffins'
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end
