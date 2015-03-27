require 'rails_helper'

describe "delete a comment process" do
  it "deletes a comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    comment = FactoryGirl.create(:comment)
    comment.update(:user_id => user.id)
    visit post_path(comment.post_id)
    click_on 'Delete comment'
    expect(page).to have_content 'deleted'
  end
end
