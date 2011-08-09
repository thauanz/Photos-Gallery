require 'spec_helper'

describe "Area admin" do

  let(:user) {Factory.create(:user) }

  describe "with valid credentials" do
    it "must have valid credentials to access" do
      sign_in_user(user, "password")
      page.should have_content("Signed in successfully")
      current_path.should == galleries
    end

    it "should not have valid access credentials" do
      sign_in_user(user, "1234567")
      page.should have_content("Invalid email or password.")
    end
  end

  it "must get out of credentials" do
    sign_in_user(user, "password")
    page.should have_content("Signed in successfully")

    click_link("Logout")
    page.should be_has_css("span#notice.flash_message", :text => "Signed out successfully.")
    current_path.should == homepage
  end

  it "link to register should not appear" do
    visit sign_in
    page.should be_has_no_link("Sign up")
    visit new_password
    page.should be_has_no_link("Sign up")
  end

end

