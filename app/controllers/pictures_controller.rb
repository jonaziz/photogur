class PicturesController < ApplicationController

	before_filter :load_pictures

	# Most methods inside controllers are called actions
	## If index is empty, you can completely remove it and Rails will
	## still work. It knows the index.html exists.
	def index
	end

	def show
		@picture = @pictures[params[:id].to_i]

		# Tells Rails to skip HTML and just render this text
		# Params goes to router and looks for this
		render :text => "Hello world #{params[:id]}"
	end

	def load_pictures
		@pictures = [
	      {
	        :title  => "The old church on the coast of White sea",
	        :artist => "Sergey Ershov",
	        :url    => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg"
	      },
	      {
	        :title  => "Sea Power",
	        :artist => "Stephen Scullion",
	        :url    => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg"
	      },
	      {
	        :title  => "Into the Poppies",
	        :artist => "John Wilhelm",
	        :url    => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg"
	      }
  		]
	end

end