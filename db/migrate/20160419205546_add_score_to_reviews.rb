class AddScoreToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :rating, :integer, default: 1
  end
end
