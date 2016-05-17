class User < ActiveRecord::Base
  validates :password, presence: true
  validates :email, uniqueness: true

  has_many :songs
  has_many :votes

end