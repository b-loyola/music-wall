class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :song

	validates :song_id, uniqueness: {scope: :user_id}
	after_create :update_song_votes

	def update_song_votes
		song.vote_count += 1
		song.save
	end

end