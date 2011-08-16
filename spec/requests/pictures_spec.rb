require "spec_helper"

describe "display pictures to users" do

  before(:each) do
    @gallery = Factory(:gallery)
    @picture = @picture = @gallery.pictures.create(picture_attributes)
  end

  context "homepage" do
    it "navigate between the galleries and pictures" do
      visit homepage
      within("a#picture_#{@picture.id}") do
        page.should have_css('img', :src => "#{@picture.image_url(:small)}")

      end
      click_link "picture_#{@picture.id}"
      current_path.should == show_picture_none(@gallery.id, @picture.id)
    end
  end
end

