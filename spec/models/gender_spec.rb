require 'spec_helper'

describe Gender do
  it "should be invalid without name" do
    FactoryGirl.build(:gender, :name => nil).should_not be_valid
  end

  it "should be invalid with empty name" do
    FactoryGirl.build(:gender, :name => "").should_not be_valid
  end

  it "should be invalid with too long name" do
    FactoryGirl.build(:gender, :name => "A" * 33).should_not be_valid
  end

  it "should be invalid with wrong name" do
    FactoryGirl.build(:gender, :name => "Wrong gender").should_not be_valid
  end

  it "should be valid with proper name" do
    FactoryGirl.build(:gender).should be_valid
  end
end
