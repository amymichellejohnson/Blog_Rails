require 'rails_helper'

describe "delete a comment process" do
  it "deletes a comment" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    comment = Comment.create(:name =>"Amy", :comment =>"I agree", :post_id => 1)
    visit post_path(post)
    click_on 'Delete comment'
    expect(page).to have_content 'deleted'
  end
end
