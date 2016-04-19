class User < ActiveRecord::Base
	has_many :songs
	has_many :votes

	validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, presence: true, length: {minimum: 6}

end