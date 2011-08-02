require 'spec_helper'

describe Picture do

  before(:each){
    @user = Factory(:user)
    @gallery = Factory(:gallery, :user => @user)
    @gallery.pictures.create(
      title: "Teste",
      image: File.open("/home/thauan/Imagens/curso-ruby.jpg"),
      description: %w(Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.)
    )
  }

  #db
  context "db fields" do
    it { should have_fields(:title, :description, :image).of_type(String) }
  end

  #associations
  context "associations" do
    it { should be_embedded_in(:gallery).as_inverse_of(:pictures) }
    #it { should belong_to(:gallery) }
  end

  #validations
  context "validations" do
    it { should validate_presence_of(:gallery) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }

    it { should validate_uniqueness_of(:title) }
  end

end

