class User < ActiveRecord::Base

  has_many :tracks

  validates :email, :password, presence: true
end