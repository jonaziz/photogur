class PicturesController < ApplicationController

	# Most methods inside controllers are called actions
	## If index is empty, you can completely remove it and Rails will
	## still work. It knows the index.html exists.
	def index
		# Loading all pictures only where needed (index)
		if params[:free] == "yes"
			@pictures = Picture.free.alphabetical.all
		else
			@pictures = Picture.alphabetical.all
		end
	end

	def new
		@picture = Picture.new	
	end

	def create
		# Create in place of new was added before, but will always 
		# create a new object so it will always be true.
		@picture = Picture.new(params[:picture])
		if @picture.save
			redirect_to pictures_path
		else
			# There was an error on the form.
			flash.now[:error] = "Specified fields cannot be blank."

			render :new
		end
	end

	def show
		@picture = Picture.find params[:id]
	end

	def edit
		@picture = Picture.find params[:id]
	end

	def update
		@picture = Picture.find params[:id]

		if @picture.update_attributes(params[:picture])
			# Named routes (are methods) allow us to navigate app.
			# Can use just "@picture" without ID.
			# redirect_to picture_path(@picture.id)
			redirect_to @picture
			# We're passing picture and redirect_to method looks for
			# an ID.
		else
			# There was an error on the form.
			flash.now[:error] = "Specified fields cannot be blank."

			render :edit
		end
	end

	def destroy
		@picture = Picture.find params[:id]

		if @picture.destroy
			redirect_to pictures_path
		else
			redirect_to @picture
		end
	end

end

# params looks like = {
# 	:id => "4",
# 	:picture => {
# 		:title => "Title",
# 		:url => "http",
# 		:artist => "Someone"
# 	}
# }

# The form "for" picture, recognizes that it should just pass things in
# a way that the data can be accessed easily.