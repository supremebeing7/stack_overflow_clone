require 'spec_helper'

describe User do
  before :each do
    FactoryGirl.create(:user)
  end
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :password }
  it { should have_many :answers }
  it { should have_many :questions }
end
