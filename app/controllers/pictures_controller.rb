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
		@picture = Picture.new	
	end

	def create
		# We have access to parameters from any action (Post or Get).
		# For example, we take id on a get to use below. This time
		# we're getting params from form submit.
		
		# # Creating an instance of picture
		# @picture = Picture.new

		# # Taking parameters from form and adding to the picture
		# # instance created for this 'create' event.
		# @picture.url = params[:url]
		# @picture.artist = params[:artist]
		# @picture.title = params[:title]

		# # Changed from old style to use create.
		# # Solution 2 
		# @picture = Picture.create!(params[:picture])

		# # Set variable equal to save to DB action done on the
		# # instance used in this 'create' event/
		# success = @picture.save

		# Checked to make sure it saved and redirected back
		# to the homepage.

		# This new way treats picture as a hash

		if Picture.create!(params[:picture])
			# Equivalent to '/picture'.
			# Redirect_to utilizes a "GET", so we go to index.
			redirect_to pictures_path
		end
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

	def edit
		@picture = Picture.find params[:id]
	end

	def update
		@picture = Picture.find params[:id]
		# @picture.url = params[:url]
		# @picture.artist = params[:artist]
		# @picture.title = params[:title]
		# success = @picture.save

		# Preferred solution
		success = @picture.update_attributes(
			:title => params[:title], 
			:artist => params[:artist], 
			:url => params[:url]
		)

		if success
			redirect_to "/pictures/#{@picture.id}"
		else
			#In future will want to show something else
			redirect_to "/pictures/#{@picture.id}"
		end
	end

end