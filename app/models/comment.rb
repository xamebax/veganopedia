class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :body, :product, :product_id

  validates :product,
    :presence => true
end
