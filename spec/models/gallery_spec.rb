require 'spec_helper'

describe Gallery do

  before(:each){ Factory.create(:gallery) }
  #db
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_index(:user_id) }

  #associations
  it { should belong_to(:user) }
  it { should have_many(:pictures)}

  #validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }

end

