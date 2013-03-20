class CreatePictures < ActiveRecord::Migration
  # Up is for migrating in the 'normal' direction. Adding more
  # stuff to database and moving in a 'forward direction'.
  def up
  	# DB needs to exist before you can create table.	
  	create_table :pictures do |t|
  		t.string :artist
  		t.string :title
  		t.string :url
  	end
  end

  # In emergencies we want to roll back, we can do so, but
  # the table is still there. Down is the opposite of up, but
  # we don't use this often.
  def down
  	# Example
  	# Easy to undo something you create, but this doesn't work
  	# because it is hard to fix mistakes.
  	# drop_table :pictures
  end
end
