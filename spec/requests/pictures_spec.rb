require 'spec_helper'

feature "Pictures", %q{
  To access the system
  As a user
  I will have available the option to manage the images
} do

  let(:user) { Factory.create(:user) }

  before(:each) do
    @picture = Factory.create(:picture)
    @gallery = Factory(:gallery)
    sign_in_user(user, "password")
    visit show_gallery
  end

  def edit_links
    click_link "edit"
    current_path.should == edit_picture
    page.should be_has_field("Title", :with => @picture.title)

    fill_in "Title", :with => "#{@picture.title} 123456"
    click_button "Save"
    current_path.should == show_gallery
    page.should be_has_content("#{@picture.title} 123456")
  end

  it "a picture new for gallery" do
    click_link "Add a Picture"
    current_path.should == new_picture
    fill_in "picture_title", :with => "TESte"
    page.attach_file("picture_image", path_to_file)
    click_button "Save"
    current_path.should == show_gallery
  end

  it "should change picture the gallery" do
    edit_links
  end

  context "view switch picture" do
    def select_picture
      click_link "picture_#{@picture.id}"
      current_path.should == show_picture
    end

    it "should change the picture inside the viewing" do
      select_picture
      edit_links
    end
  end

end

