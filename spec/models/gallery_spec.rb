require 'spec_helper'

describe Gallery do

  before(:each) do
    @user = Factory.create(:user)
    @gallery = Factory.create(:gallery, :user => @user)
  end

  #db
  context "db fields" do
    it { should have_fields(:name, :user_id) }
    it { should have_field(:name).of_type(String) }
  end

  #associations
  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:pictures)}
  end

  #validations
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
  end
end

