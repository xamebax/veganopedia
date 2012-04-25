class Product < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company, :ingriedients, :name, :price, :shops, :user_id, :user

  validates :name,
    :presence => true,
    :uniqueness => true,
    :length => { :maximum => 128 }

  validates :company,
    :length => { :maximum => 128 }

  validates :shops,
    :length => { :maximum => 128 }

  validates :ingriedients,
    :length => { :maximum => 128 }

  validates :user,
    :presence => true
end
