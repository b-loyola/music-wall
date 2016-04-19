class AddVotesToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :vote_count, :integer, default: 0
  end
end
