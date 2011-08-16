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
    @gallery = Factory(:gallery)
    @picture = @gallery.pictures.create!(picture_attributes)
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

