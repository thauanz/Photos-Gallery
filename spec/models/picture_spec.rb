require 'spec_helper'

describe Picture do

  before(:each){ Factory.create(:picture) }

  #db
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:gallery_id).of_type(:integer) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:image).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_index(:user_id) }
  it { should have_db_index(:gallery_id) }

  #associations
  it { should belong_to(:user) }
  it { should belong_to(:gallery) }

  #validations
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:gallery_id) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).scoped_to(:gallery_id).case_insensitive }
  it { should validate_presence_of(:image) }

end

