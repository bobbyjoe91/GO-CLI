require_relative 'user.rb'
require_relative 'driver.rb'

class Map
	def initialize(size, user_location, driver_location)
		@size = size
		@map = Array.new(size){Array.new(size){"."}}
		#mark user's location
		@map[user_location[0]][user_location[1]] = "u"
		#mark driver's location
		for i in 0...driver_location.length
			@map[driver_location[i][0]][driver_location[i][1]] = "d"
		end
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

