class TempController < ApplicationController
	def temp
		render file: 'file.txt'
	end
end
