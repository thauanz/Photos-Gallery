require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @user = Factory(:user)
    ImageUploader.enable_processing = true
  end

  after do
    ImageUploader.enable_processing = false
  end

  before(:each) {
#    @user = Factory(:user)
    @gallery = Factory(:gallery)
    @picture = @gallery.pictures.create!(
      title: "Teste",
      image: File.open("/home/thauan/Imagens/curso-ruby.jpg"),
      description: %w(Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.)
    )
  }

  context 'the small version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @picture.image.small.should be_no_larger_than(200, 200)
    end
  end

  describe 'the original version' do
    it "should scale down an image to fit within 500 by 500 pixels" do
      @picture.image.should be_no_larger_than(500, 500)
    end
  end

  it "should remove file the images" do
    @picture.destroy
    File.exist?(File.join(Rails.root, 'public', @picture.image.url)).should be_false
  end

end

