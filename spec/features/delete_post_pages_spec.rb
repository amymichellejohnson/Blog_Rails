require 'rails_helper'

describe "delete a post process" do
  it "deletes a post" do
    user = FactoryGirl.create(:admin)
    sign_in(user)
    post = FactoryGirl.create(:post)
    post.update(:user_id => user.id)
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content 'deleted'
  end
end
