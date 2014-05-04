require 'spec_helper'

describe Passenger do
	
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  it { should validate_uniqueness_of :email }

  it { should have_one :booking }
  it { should have_one :teleporter }

end
