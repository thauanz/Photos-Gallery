require 'spec_helper'

describe User do

  before(:each) { @user = Factory(:user) }

  #validate bd
  context "bd validate" do
    it { should have_fields(:email, :full_name) }
    it { should have_field(:full_name).of_type(String) }
  end

  #validations
  context "validations" do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password) }
    it { should validate_format_of(:email).to_allow("maria@gmail.com") }
  end

  #associations
  context "associations" do
    it { should have_many(:galleries) }
  end

end

