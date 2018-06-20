require_relative 'user.rb'

class Map
	def initialize(size, user_location, driver_location)
		@size = size
		@map = Array.new(size){Array.new(size){"."}}
		@map[user_location[0]][user_location[1]] = "u"
		for i in 0...driver_location.length
			@map[driver_location[i][0]-1][driver_location[i][1]-1] = "d"
		end
	end
	def showmap
		for i in 0...@size
			for j in 0...@size
				print map[i][j]
			end
		print "\n"
		end
	end
	
end

