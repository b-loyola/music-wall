class Review < ActiveRecord::Base
	belongs_to :song
	belongs_to :user

	validates :song_id, uniqueness: {scope: :user_id}

end