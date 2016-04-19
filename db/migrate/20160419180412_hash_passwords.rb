class HashPasswords < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.remove :password
  		t.string :password_hash
  	end
  end
end
