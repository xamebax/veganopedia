class Comment < ActiveRecord::Base
  belongs_to :user, :product
  attr_accessible :body
end
