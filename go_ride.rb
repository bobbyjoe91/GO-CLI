require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'map.rb'

class Go_ride
	attr_reader :driver, :unit_price, :price, :destination
	attr_writer :unit_price

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
	def set_unit_cost(price = 3500)
		@unit_price = price
	end
	def show_route
		
	end
	def trip_price(destination)
		@dest_dist = (destination[0]-@user_loc[0]).abs + (destination[1]-@user_loc[1]).abs + 1
		@price = @dest_dist*@unit_price
	end
end

def	trip(ride)
	puts "======================================"
	print "Your driver is Mr. ", ride.driver[0], ride.driver[1], "\n"
	puts "Here is the route to your destination:\n"
	ride.show_route
	print "Here is your charge: Rp", ride.trip_price(ride.destination), "\n"
	puts "======================================"
end
