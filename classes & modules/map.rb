require_relative 'user.rb'
require_relative 'driver.rb'

class Map
	def initialize(size, user_location, driver_location)
		@size = size
		@map = Array.new(size){Array.new(size){"."}}
		#mark driver's location
		for i in 0...driver_location.length
			@map[driver_location[i][0]][driver_location[i][1]] = "O"
		end
		#mark user's location
		@map[user_location[0]][user_location[1]] = "V"
	end
	def showmap
		#printing map
		for i in 0...@size
			for j in 0...@size
				print @map[i][j]
			end
		print "\n"
		end
	end
	
end

