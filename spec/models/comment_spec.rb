require 'spec_helper'

describe Comment do
  let(:comment) { Comment.new }
  let(:user) { FactoryGirl.create(:user) }

  before(:all) do
    user.make_current
    @product = FactoryGirl.create(:product)
  end

  it "should have the correct attributes" do
    should respond_to(:owner)
    should respond_to(:body)
    should respond_to(:commentable)
  end

  it "should not allow comments of comments" do
    Comment.class_eval do
      include Opinio::OpinioModel::RepliesSupport
    end

    c = Comment.new(:body => "The Comment !")
    c.commentable = @product
    c.owner_id = user.id
    c.save

    c2 = c.dup
    c2.commentable = c
    c.save.should == true

    c3 = c2.dup
    c3.commentable = c2
    c3.save.should == false

    c3.errors[:base].count.should == 1
  end

  it "should validate presence of body and commentable" do
    comment.should be_invalid
    comment.errors[:body].should be_present
    comment.errors[:commentable].should be_present
  end

  it "and it should insist on having an owner" do
    c = Comment.new(:body => "The Comment !")
    c.commentable = @product
    c.save.should == false
  end
end
