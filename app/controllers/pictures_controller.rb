class PicturesController < ApplicationController

	# before_filter :load_pictures

	# Most methods inside controllers are called actions
	## If index is empty, you can completely remove it and Rails will
	## still work. It knows the index.html exists.
	def index
		# Loading all pictures only where needed (index)
		@pictures = Picture.all
	end

	def new
	end

	def create
		# We have access to parameters from any action (Post or Get).
		# For example, we take id on a get to use below. This time
		# we're getting params from form submit.
		
		# Creating an instance of picture
		@picture = Picture.new

		# Taking parameters from form and adding to the picture
		# instance created for this 'create' event.
		@picture.url = params[:url]
		@picture.artist = params[:artist]
		@picture.title = params[:title]

		# Set variable equal to save to DB action done on the
		# instance used in this 'create' event/
		success = @picture.save

		# Checked to make sure it saved and redirected back
		# to the homepage.
		if success
			# Equivalent to '/picture'.
			# Redirect_to utilizes a "GET", so we go to index.
			redirect_to pictures_path
		end
		#render:text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
	end

	def show
		# Instead of array, we now are using find on the the
		# picture model. We're looking for the ID #.
		@picture = Picture.find params[:id]
		# Tells Rails to skip HTML and just render this text
		# Params goes to router and looks for this
		# render :text => "Hello world #{params[:id]}"

		# Some more on search:
		# Picture.where({:artist => "Zoe"}) => return array
		# Multiple matches possible, empty array (no matches)
		# also possible.
	end

	# def load_pictures
	# 	# This return is a collection (Array) of pictures, not
	# 	# hashes.
	# 	# @pictures = Picture.all
	#   # This is a collection of hashes.
	# 	# @pictures = [
	#  #      {
	#  #        :title  => "The old church on the coast of White sea",
	#  #        :artist => "Sergey Ershov",
	#  #        :url    => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg"
	#  #      },
	#  #      {
	#  #        :title  => "Sea Power",
	#  #        :artist => "Stephen Scullion",
	#  #        :url    => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg"
	#  #      },
	#  #      {
	#  #        :title  => "Into the Poppies",
	#  #        :artist => "John Wilhelm",
	#  #        :url    => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg"
	#  #      }
 #  # 		]
	# end

end