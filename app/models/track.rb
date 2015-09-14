class Track < ActiveRecord::Base

  validates :title, :author, presence: true

end