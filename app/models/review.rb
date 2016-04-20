class Review < ActiveRecord::Base
	belongs_to :song
	belongs_to :user

	validates :song_id, uniqueness: {scope: :user_id}
	validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end