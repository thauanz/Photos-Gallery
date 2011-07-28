require 'spec_helper'

describe Picture do

  before(:each){
    @user = Factory(:user)
    @gallery = Factory(:gallery, :user => @user)
    @picture = Factory.create(:picture, :gallery => @gallery)
  }

  #db
  context "db fields" do
    it { should have_fields(:title, :description, :image).of_type(String) }
  end

  #associations
  context "associations" do
    #it { should be_referenced_in(:user) }
    it { should belong_to(:gallery) }
  end

  #validations
  context "validations" do
    #it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:gallery) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }

    it { should validate_uniqueness_of(:title) }
  end

end

