require 'spec_helper'

describe Picture do

  before(:each){
    @gallery = Factory(:gallery)
    @picture = @gallery.pictures.create(picture_attributes)
  }

  #db
  context "db fields" do
    it { should have_fields(:title, :description).of_type(String) }
  end

  #associations
  context "associations" do
    it { should be_embedded_in(:gallery).as_inverse_of(:pictures) }
  end

  #validations
  context "validations" do
    it { should validate_presence_of(:gallery) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }

    it { should validate_uniqueness_of(:title) }
  end

  context "directory pictures" do
    it "should be modified title and recreate the directory" do
      @picture.title = "Editing teste"
      @picture.save
      @pic = Gallery.find(@gallery.id).pictures.first
      File.join(Dir.pwd,"public", @pic.image.url).should == @picture.image.path
    end

    it "should be modified title and erase the old directory" do
      path_old_picture = @picture.image.path
      @picture.title = "Editing teste"
      @picture.save
      File.exist?(path_old_picture).should_not == true
    end

    it "should be modified title and image the directory" do
      @picture.title = "Editing teste"
      @picture.image_filename = "foto_teste.jpg"
      @picture.save
      File.exist?(@picture.image.path).should == true
    end
  end

end

