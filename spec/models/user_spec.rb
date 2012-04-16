require 'spec_helper'

describe User do
  it 'should be invalid without username' do
    FactoryGirl.build(:user, :username => nil).should_not be_valid
  end

  it 'should be invalid with empty username' do
    FactoryGirl.build(:user, :username => '').should_not be_valid
  end

  it 'should be invalid with too long username' do
    FactoryGirl.build(:user, :username => 'a' * 33).should_not be_valid
  end

  it 'should be invalid with taken username' do
    FactoryGirl.create(:user, :username => 'username')
    FactoryGirl.build(:user, :username => 'username').should_not be_valid
  end

  it "should be invalid without email" do
    FactoryGirl.build(:user, :email => nil).should_not be_valid
  end

  it 'should be invalid with empty email' do
    FactoryGirl.build(:user, :email => '')
  end

  it 'should be invalid with wrong email' do
    FactoryGirl.build(:user, :email => 'usernamedomain.com')
  end

  it 'should be invalid with taken email' do
    FactoryGirl.create(:user, :email => 'email@example.com')
    FactoryGirl.build(:user, :email => 'email@example.com').should_not be_valid
  end

  it 'should be invalid without password' do
    FactoryGirl.build(:user, :password => nil).should_not be_valid
  end

  it 'should be invalid with empty password' do
    FactoryGirl.build(:user, :password => '').should_not be_valid
  end

  it 'should be invalid with too short password' do
    FactoryGirl.build(:user, :password => '123456').should_not be_valid
  end

  it 'should be valid with proper data' do
    FactoryGirl.build(:user).should be_valid
  end
end
