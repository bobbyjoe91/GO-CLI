require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'map.rb'

class Go_ride
	attr_reader :driver

	def initialize(arr_dest)
		@destination = arr_dest
	end
	def pick_driver(user_loc, driv_loc)
		@user_loc = user_loc
		@driv_loc = driv_loc
		for i in 0...@driv_loc.length
			@dist = (@driv_loc[i][0]-@user_loc[0]).abs + (@driv_loc[i][1]-@user_loc[1]).abs
			if i == 0
				@min_dist = @dist
				@driver = @driv_loc[i]
			else
				if @dist < @min_dist
					@min_dist = @dist
					@driver = @driv_loc[i]
				end
			end
		end
	end
	def show_route
	
	end
end
