require "spec_helper"

describe "display pictures to users" do

  before(:each) do
    @gallery = Factory(:gallery)
    @picture = @picture = @gallery.pictures.create(
      title: "Teste",
      image: File.open("/home/thauan/Imagens/curso-ruby.jpg"),
      description: %w(Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.)
    )
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

