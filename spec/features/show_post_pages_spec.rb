require 'rails_helper'

describe "show a post process" do
  it "shows the details of a post" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    visit post_path(post)
    expect(page).to have_content 'So happy I attended'
  end
end
