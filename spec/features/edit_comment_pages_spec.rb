require 'rails_helper'

describe "edit a comment process" do
  it "edits a comment name" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    comment = Comment.create(:name =>"Amy", :comment =>"I agree", :post_id => 1)
    visit post_path(post)
    click_on 'Edit comment'
    fill_in 'Your name', :with => 'AJ'
    click_on 'Update Comment'
    expect(page).to have_content 'edited'
  end

    it "edits a comment comment" do
      post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
      comment = Comment.create(:name =>"Amy", :comment =>"I agree", :post_id => 1)
      visit post_path(post)
      click_on 'Edit comment'
      fill_in 'Comment', :with => 'Yes!'
      click_on 'Update Comment'
      expect(page).to have_content 'edited'
    end
end
