class PicturesController < ApplicationController

	# Most methods inside controllers are called actions
	def index
		@greeting = "Hello World"

		@pictures = [
			'http://cdn4.leftlanenews.com/photos/content/january2013/thumbnails5.0/ford-f-150-review-ri_663.jpg',
			'http://cdn4.leftlanenews.com/photos/content/january2013/thumbnails5.0/mercedes-cla45-leak-ri_300.jpg',
			'http://cdn4.leftlanenews.com/photos/content/january2013/thumbnails5.0/fiskerrestart_300.jpg'
		]
	end
end