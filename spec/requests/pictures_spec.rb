require 'spec_helper'

feature "Pictures", %q{
  To access the system
  As a user
  I will have available the option to manage the images
} do

  let(:user) { Factory.create(:user) }

  before(:each) do
    @gallery = Factory(:gallery, user: user)
    @picture = @gallery.pictures.create(
      title: "Teste",
      image: File.open("/home/thauan/Imagens/curso-ruby.jpg"),
      description: %w(Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.)
    )
    sign_in_user(user, "password")
    visit show_gallery(@gallery.id)
  end

  def edit_links
    number = rand(99)
    click_link "edit"
    current_path.should == edit_picture(@gallery.id, @picture.id)
    page.should be_has_field("Title", with: @picture.title)

    fill_in "Title", with: "#{@picture.title} #{number}"
    click_button "Save"
    current_path.should == show_gallery(@gallery.id)
    page.should be_has_content("#{@picture.title} #{number}")
  end

  it "a picture new for gallery" do
    click_link "Add a Picture"
    current_path.should == new_picture(@gallery.id)
    fill_in "picture_title", with: "TESte"
    page.attach_file("picture_image", path_to_file)
    click_button "Save"
    current_path.should == show_gallery(@gallery.id)
  end

  it "should change picture the gallery" do
    edit_links
  end

  context "view switch picture" do

    def select_picture
      click_link "picture_#{@picture.id}"
      current_path.should == show_picture(@gallery.id, @picture.id)
    end

    it "should change the picture inside the viewing" do
      select_picture
      edit_links
    end
  end

end

