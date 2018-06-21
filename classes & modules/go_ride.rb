require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'map.rb'
require_relative 'history.rb'

class Go_ride
	attr_reader :driver, :unit_price, :price, :destination, :user_loc, :route
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
	#route printer
	def show_route
		@dest_tmp = @destination.map {|item| item+1}
		@user_tmp = @user_loc.map {|item| item+1}
		@route = route_printer(@user_tmp, @dest_tmp)
	end
	def unit_cost(price = 3500)
		@unit_price = price
	end
	def trip_price(destination)
		@dest_dist = (destination[0]-@user_loc[0]).abs + (destination[1]-@user_loc[1]).abs
		@price = @dest_dist*@unit_price
	end
end

module Confirm
	def Confirm.message
		sleep(2)
		puts "Yeay, you have arrived! Thank you"
	end
end

module Exchange #'json-like' data for writing history info
	def Exchange.driver(ride)
		driver_name = ride.driver[0] + ride.driver[1]
		return driver_name
	end
	def Exchange.price(ride)
		return ride.trip_price(ride.destination)
	end
	def Exchange.destination(ride)
		arr_des = ride.destination.map {|i| i+1}
		return arr_des
	end
	def Exchange.from(ride)
		arr_from = ride.user_loc.map {|i| i+1}
		return arr_from
	end
	def Exchange.route(ride)
		return ride.route
	end
end

def	trip(ride)
	puts "======================================"
	print "Your driver is Mr. #", ride.driver[0]+ride.driver[1], "\n"
	puts "Route to your destination:\n"
	puts ride.show_route()
	print "Trip price: Rp", ride.trip_price(ride.destination), "\n"
	puts "======================================"
	
	print "Confirm trip [Y/n]: "
	ans = STDIN.gets.chomp
	print "\n"
	if ans == "Y" || ans == "y"
		print "Please wait...\n"
		Confirm::message
		history = History.new(ride)
		return flag = 1
	else
		return flag = 0
	end
end

def route_printer(user_location, destination)
	route = " - start at " + user_location.to_s + "\n"
	if user_location[0] < destination[0] && user_location[1] != destination[1]
		while user_location[0] != destination[0]
			user_location[0] += 1
			route += " - go to " + user_location.to_s + "\n" 
		end
		if user_location[1] < destination[1]
			route += " - turn left\n"
			while user_location[1] != destination[1]
				if user_location[1]+1 == destination[1]
					user_location[1] += 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[1] += 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		else
			route += " - turn right\n"
			while user_location[1] != destination[1]
				if user_location[1]-1 == destination[1]
					user_location[1] -= 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[1] -= 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		end
	elsif user_location[0] > destination[0] && user_location[1] != destination[1]
		while user_location[0] != destination[0]
			user_location[0] -= 1
			route += " - go to " + user_location.to_s + "\n" 
		end
		if user_location[1] > destination[1]
			route += " - turn left\n"
			while user_location[1] != destination[1]
				if user_location[1]-1 == destination[1]
					user_location[1] -= 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[1] -= 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		else
			route += " - turn right\n"
			while user_location[1] != destination[1]
				if user_location[1]+1 == destination[1]
					user_location[1] += 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[1] += 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		end
	elsif user_location[1] == destination[1]
		if	user_location[0] < destination[0]
			while user_location[0] != destination[0]
				if user_location[0]+1 == destination[0]
					user_location[0] += 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[0] += 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		else
			while user_location[0] != destination[0]
				if user_location[0]-1 == destination[0]
					user_location[0] -= 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[0] -= 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		end
	elsif user_location[0] == destination[0]
		if user_location[1] < destination[1]
			while user_location[1] != destination[1]
				if user_location[1]+1 == destination[1]
					user_location[1] += 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[1] += 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		else
			while user_location[1] != destination[1]
				if user_location[1]-1 == destination[1]
					user_location[1] -= 1
					route += " - finish at " + user_location.to_s + "\n"
				else
					user_location[1] -= 1
					route += " - go to " + user_location.to_s + "\n"
				end
			end
		end
	end
	return route
end
