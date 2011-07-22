require 'spec_helper'

describe User do

  before(:each) { Factory.create(:user) }
  #validate bd
  it { should have_db_index(:email).unique(true) }

  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:full_name).of_type(:string).with_options(:null => false) }
  it { should have_db_column(:encrypted_password).of_type(:string) }

  #validations
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:email) }

  #validate format
  it { should allow_value("maria@gmail.com").for(:email) }
  it { should_not allow_value("maria@gmail").for(:email) }

  #associations
  it { should have_many(:pictures).dependent(:destroy) }
  it { should have_many(:galleries) }

end

