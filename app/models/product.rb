class Product < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :company, :ingriedients, :name, :price, :shops, :user_id, :user

  before_validation :set_user, :on => :create

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

  private

  def set_user
    self.user = User.current
  end
end
