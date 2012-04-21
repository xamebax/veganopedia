class Gender < ActiveRecord::Base
  attr_accessible :name

  validates :name,
    :presence => true,
    :uniqueness => true,
    :length => { :maximum => 32 },
    :inclusion => { :in => ["Female", "Male", "Other"] }
end
