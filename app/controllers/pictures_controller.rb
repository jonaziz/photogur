class PicturesController < ActionController::Base

	# Most methods inside controllers are called actions
	def index
		@greeting = "Hello World"
	end
end