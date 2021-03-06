require "spec_helper"

describe "Galleries Requests" do

  before(:each) do
    @user = Factory.create(:user)
    @gallery = Factory.create(:gallery, :user_id => @user.id)
    @picture = @gallery.pictures.create(picture_attributes)
    sign_in_user(@user, "password")
  end

  context "Admin" do
    context "view all galleries" do
      it "should view position the gallery" do
        page.should be_has_css("div#gallery h2 a", :text => @gallery.name )
        page.should be_has_content("Pictures: #{@gallery.pictures.size}")
      end
    end

    it "should a link new gallery" do
      click_link("New gallery")
      current_path.should == new_gallery
    end

    it "should valid a new gallery" do
      visit(new_gallery)
      fill_in "gallery[name]", :with => @gallery.name
      click_button("Save")
      current_path.should == galleries
      page.should have_content("Gallery was successfully created.")

      visit(new_gallery)
      fill_in "gallery[name]", :with => ""
      click_button("Save")
      page.should_not have_content("Gallery was successfully created.")
    end

    it "should access link to edit" do
      click_link("edit")
      current_path.should == edit_gallery(@gallery.id)
      page.should be_has_field('Name', :with => @gallery.name )

      fill_in "Name", :with => "#{@gallery.name} 1"
      click_button("Save")
      page.has_css?("div#gallery h2 a", :text => "#{@gallery.name} 1" ).should be
    end

    context "see all pictures the gallery" do
      def gallery_view_show
        click_link @gallery.name
        current_path.should == show_gallery(@gallery.id)
      end

      it "should view picture to gallery" do
        gallery_view_show
        page.should have_content("There is no pictures yet.") if @gallery.pictures.count.zero?
      end

      it "should view back all galleries" do
        gallery_view_show
        click_link "View Galleries"
        current_path.should == galleries
      end
    end
  end

  context "as a user of the site, I browse the galleries" do
    it "displaying image galleries in large formats and small" do
      visit homepage
      click_link @gallery.name
      page.has_xpath?('.//div[@class = "picture"]', :count => @gallery.pictures.count).should be_true

      click_link "picture_#{@gallery.pictures.first.id}"
      current_path.should == show_picture_none(@gallery.id, @picture.id)
    end
  end
end

