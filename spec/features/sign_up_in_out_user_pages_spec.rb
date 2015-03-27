require 'rails_helper'

describe "the sign up user process" do
  it "signs a user up" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', :with => 'derp@derp.com'
    fill_in 'Password', :with => 'derpderp'
    fill_in 'Password confirmation', :with => 'derpderp'
    click_button 'Sign up'
    expect(page).to have_content "successfully"
  end
  it "throws an error when the password confirmation doesn't match" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', :with => 'derp@derp.com'
    fill_in 'Password', :with => 'derpderp'
    fill_in 'Password confirmation', :with => 'herpherp'
    click_button 'Sign up'
    expect(page).to have_content "error"
  end
end


describe "the sign in user process" do
  it "signs a user in" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(page).to have_content "successfully"
  end
  it "throws an error when the password doesn't match" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'herp'
    click_button 'Log in'
    expect(page).to have_content "Invalid"
  end

  it "throws an error when the user doesn't exist" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', :with => 'blahdeeblahblah@bork.com'
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(page).to have_content "Invalid"
  end
end

describe "the log out user process" do
  it "logs a user out" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit root_path
    click_on 'Log out'
    expect(page).to have_content "successfully"
  end

end
