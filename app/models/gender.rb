class Gender < ActiveRecord::Base
  attr_accessible :name, :users
  has_many :users

  validates :name,
    :presence => true,
    :uniqueness => true,
    :length => { :maximum => 32 },
    :inclusion => { :in => ["Female", "Male", "Other"] }
end
