class AddVotesTable < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.references :user
  		t.references :song
  		t.timestamps null: false
  	end
  end
end
