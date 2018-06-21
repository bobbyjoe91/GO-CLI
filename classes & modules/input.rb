require_relative 'generator.rb'
require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'go_ride.rb'
require_relative 'map.rb'
require_relative 'history.rb'

module Command
	def Command.show_map(_map)
		_map.showmap
	end
	def Command.order(_ride,_userloc,_driverloc, _unit_cost = "default")
		if _unit_cost == "default"
			_unit_cost = 3500
		end
		print "Searching nearest driver...\n"
		sleep(3)
		_unitcost = _unit_cost
		_ride.pick_driver(_userloc, _driverloc)
		_ride.unit_cost(_unit_cost)
		flag = trip(_ride)
		return flag
	end
end

#INPUT PROGRAM

#init
args = []
driver_location = []
user_location = []
args = ARGV
#no param
if args.length == 0
	map_size = 20
	driver_count = 5
	user_x = Generate::random_num(map_size-1)
	user_y = Generate::random_num(map_size-1)
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
	driver_count = _args0[3]
	#inputing drivers' location
	for i in 1..._args.length
		_temp = _args[i].split(" ")
		_temp[0] = _temp[0].to_i-1
		_temp[1] = _temp[1].to_i-1
		driver_location << _temp
	end
#three params
elsif args.length == 3
	map_size = args[0].to_i
	user_x = args[1].to_i-1
	user_y = args[2].to_i-1
	driver_count = 5
	for i in 0...driver_count
		driver_location << Generate::random_xy(map_size-1)
	end
end
#classes and vars init
user_location = [user_x, user_y]
_user = User.new(user_location)
_driver = Driver.new(driver_location)
_unit_cost = "default"
map = Map.new(map_size, _user._loc, _driver.locations)
flag = 0

#program flow
print "\nPlease enter the command: "
_command = STDIN.gets.chomp
while true
	if _command == "show map"
		if flag == 1
			#map change if trip has made
			_user._loc = _user._dest
			map = Map.new(map_size, _user._loc, _driver.locations)
		end
		Command::show_map(map)
	elsif _command == "order go ride"
		print "Set your destination: \n"
		dest_x = STDIN.gets.chomp.to_i
		dest_y = STDIN.gets.chomp.to_i
		_user.destination = [dest_x-1, dest_y-1]
		ride = Go_ride.new(_user._dest)
		flag = Command::order(ride, _user._loc, _driver.locations,_unit_cost)
	elsif _command == "view history"
		history_viewer
	elsif _command == "exit" || _command == "quit"
		print "\nThank you. See you next time"
		for i in 1..3
			print "."
			sleep(0.5)
		end
		exit
	elsif _command == "reset unit cost"
		print "Insert new unit cost: "
		_unit_cost = STDIN.gets.chomp.to_i
	else
		puts "Invalid command. Please try again"
	end
	print "\nPlease enter the command: "
	_command = STDIN.gets.chomp
end
