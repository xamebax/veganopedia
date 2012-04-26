require 'spec_helper'

describe Product do
  before do
    FactoryGirl.create(:user).make_current
  end

  it "should be valid with valid data" do
    FactoryGirl.create(:product).should be_valid
  end

  it "should be invalid without name" do
    FactoryGirl.build(:product, :name => nil).should_not be_valid
  end

  it "should be invalid with empty name" do
    FactoryGirl.build(:product, :name => '').should_not be_valid
  end

  it "should be invalid with too long name" do
    FactoryGirl.build(:product, :name => 'a' * 129).should_not be_valid
  end

  it "should be invalid with not unique name" do
    FactoryGirl.create(:product, :name => 'not unique')
    FactoryGirl.build(:product, :name => 'not unique').should_not be_valid
  end

  it "should be valid without company" do
    FactoryGirl.build(:product, :company => nil).should be_valid
  end

  it "should be valid with empty company" do
    FactoryGirl.build(:product, :company => '').should be_valid
  end

  it "should be invalid with too long company" do
    FactoryGirl.build(:product, :company => 'a' * 129).should_not be_valid
  end

  it "should be valid without shops" do
    FactoryGirl.build(:product, :shops => nil).should be_valid
  end

  it "should be valid with empty shops" do
    FactoryGirl.build(:product, :shops => '').should be_valid
  end

  it "should be invalid with too long shops" do
    FactoryGirl.build(:product, :shops => 'a' * 129).should_not be_valid
  end

  it "should be valid without ingriedients" do
    FactoryGirl.build(:product, :ingriedients => nil).should be_valid
  end

  it "should be valid with empty ingriedients" do
    FactoryGirl.build(:product, :ingriedients => '').should be_valid
  end

  it "should set user in before validation vallback" do
    FactoryGirl.build(:product, :user => nil).should be_valid
  end

  it "should be valid without price" do
    FactoryGirl.build(:product, :price => nil).should be_valid
  end
end
