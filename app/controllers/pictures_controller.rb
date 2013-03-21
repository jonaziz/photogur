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
		# Create in place of new was added before, but will always 
		# create a new object so it will always be true.
		@picture = Picture.new(params[:picture])
		if @picture.save
			redirect_to pictures_path
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