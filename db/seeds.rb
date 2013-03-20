# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Picture.create(:artist => 'Sergey Ershov', :title => "The old church on the coast of White sea", :url => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg")
Picture.create(:artist => 'Stephen Scullion', :title => "Sea Power", :url => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg")
Picture.create(:artist => 'John Wilhelm', :title => "Into the Poppies", :url => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg")