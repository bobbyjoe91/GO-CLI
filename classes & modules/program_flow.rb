require_relative 'generator.rb'
require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'go_ride.rb'
require_relative 'map.rb'
require_relative 'history.rb'
require_relative 'command.rb'

#INPUT PROGRAM
#args init
args = []
driver_location = []
user_location = []
args = ARGV
#no param
if args.length == 0
	map_size = 20
	driver_count = 5
	user_coord = Generate::random_xy(map_size-1)
	for i in 0...driver_count
		driver_location << Generate::random_xy(map_size-1)
	end
#one param
elsif args.length == 1
	#read a file
	_file = File.open(args[0],"r")
	_args = []
	#parsing information
	i = 0
	while !_file.eof?
		_args[i] = _file.readline
		i += 1
	end
	#parsing line 1
	_args0 = _args[0].split(" ")
	for i in 0..._args0.length
		_args0[i] = _args0[i].to_i
	end
	map_size = _args0[0]
	user_x = _args0[1]-1
	user_y = _args0[2]-1
	user_coord = [user_x, user_y]
	driver_count = _args0[3]
	if user_x > map_size || user_y > map_size || user_x < 0 || user_y < 0 || !user_x.is_a?(Integer) || !user_y.is_a?(Integer) || !map_size.is_a?(Integer)
		puts "\nLocation is out of range. Please try again.\n"
		exit
	end
	#inputing drivers' location
	for i in 1..._args.length
		_temp = _args[i].split(" ")
		_temp[0] = _temp[0].to_i-1
		_temp[1] = _temp[1].to_i-1
		if (_temp[0].is_a?(Integer) && _temp[1].is_a?(Integer)) && (_temp[0] < map_size && _temp[1] < map_size) && (_temp[0] >= 0 && _temp[1] >= 0)
			driver_location << _temp
		end
	end
#three params
elsif args.length == 3
	map_size = args[0].to_i
	user_x = args[1].to_i-1
	user_y = args[2].to_i-1
	user_coord = [user_x, user_y]
	if user_x > map_size || user_y > map_size || user_x < 0 || user_y < 0 || !user_x.is_a?(Integer) || !user_y.is_a?(Integer) || !map_size.is_a?(Integer)
		puts "\nLocation is out of range. Please try again.\n"
		exit
	end
	driver_count = 5
	for i in 0...driver_count
		driver_location << Generate::random_xy(map_size-1)
	end
end

#classes and vars init
user_location = user_coord
_user = User.new(user_location)
_driver = Driver.new(driver_location)
_unit_cost = "default"
map = Map.new(map_size, _user._loc, _driver.locations)
flag = 0



#PROGRAM FLOW
print "\nPlease enter the command: "
_command = STDIN.gets.chomp
while true
	if _command == "show map"
		Command::show_map(map)

	elsif _command == "order go ride"
		order_status = true
		while order_status
			print "\nSet your destination \n"
			print "insert row   : "
			dest_x = STDIN.gets.chomp
			if dest_x == "cancel"
				puts "Order cancelled."
				order_status = false
			else
				dest_x = dest_x.to_i
				print "insert column: "
				dest_y = STDIN.gets.chomp.to_i
				print "\n"
				if [dest_x-1, dest_y-1] == _user._loc
					puts "You have been in the destination."
				elsif !(dest_x-1).is_a?(Integer) || !(dest_y-1).is_a?(Integer)
					puts "Invalid location. Please try again."
				elsif dest_x-1 > map_size || dest_y-1 > map_size || dest_y-1 < 0 || dest_x-1 < 0
					puts "Location is out of range. Please try again."
				else
					_user.destination = [dest_x-1, dest_y-1]
					ride = Go_ride.new(_user._dest)
					flag = Command::order(ride, _user._loc, _driver.locations,_unit_cost)
					order_status = false
				end
			end
		end

	elsif _command == "view history"
		history_viewer

	elsif _command == "clear history"
		history_eraser
		puts "History has been cleared"

	elsif _command == "exit" || _command == "quit"
		print "\nThank you. See you next time"
		for i in 1..3
			print "."
			sleep(0.5)
		end
		print "\n"
		exit

	elsif _command == "reset unit cost"
		print "Insert new unit cost: "
		_unit_cost = STDIN.gets.chomp.to_i

	elsif _command == "help"
		Command::help

	elsif _command == "about"
		Command::about

	elsif _command == "reload map"
		_driver.locations = Command::reload_map(driver_count, map_size)
		map = Map.new(map_size, _user._loc, _driver.locations)
		Command::show_map(map)

	else
		puts "Invalid command. Please try again"
	end

	if flag == 1 #map change if trip has been confirmed
		_user._loc = _user._dest
		_driver.locations = Command::reload_map(driver_count, map_size)
		map = Map.new(map_size, _user._loc, _driver.locations)
		flag = 0
	end

	print "\nPlease enter the command: "
	_command = STDIN.gets.chomp
end
