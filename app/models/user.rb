class User < ActiveRecord::Base

  has_many :tracks

  validates :email, :password, :first_name, :last_name, presence: true

end