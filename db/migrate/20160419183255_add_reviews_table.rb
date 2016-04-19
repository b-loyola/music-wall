class AddReviewsTable < ActiveRecord::Migration
  def change
  	create_table :reviews do |t|
  		t.text :content
  		t.references :user
  		t.references :song
  		t.timestamps null: false
  	end
  end
end
