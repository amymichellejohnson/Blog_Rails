require 'rails_helper'
describe "delete a post process" do
  it "deletes a post" do
    post = Post.create(:title => "Epicodus", :blog => "So happy I attended", :id => 1)
    visit post_path(post)
    click_on 'Delete entry'
    expect(page).to have_content 'deleted'
  end

end
