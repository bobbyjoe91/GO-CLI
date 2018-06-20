require_relative 'generator.rb'
require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'go_ride.rb'
require_relative 'map.rb'
require_relative 'history.rb'

def command_box()
	print "\nPlease enter the command: "
	_command = gets.chomp
	
	if _command == "show map"
		arg[] = ARGV
		_map = Map.new(map_size,user_location,driver_location)
		_map.showmap
		command_box()
	elsif _command == "order go ride"
		command_box()
	elsif _command == "view history"
		command_box()
	elsif _command == "exit" || _command == "quit"
	else 
		puts "Invalid command. Please try again"
	end   
end

args = []
args = ARGV
if args.length == 0
	map_size = 20
	driver_count = 5
	user_x = Generate::random_num(map_size)
	user_y = Generate::random_num(map_size)
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
	_args0 = args[0].split(" ")
	for i in 0.._args0.length-1
		_args[i] = _args[i].to_i
	end
	map_size = _args0[0]
	user_x = _args0[1]
	user_y = _args0[2]
	driver_count = _args0[3]
	driver_location = []
	#inputing drivers' location
	for i in 1..._args.length
		_temp = _args[i].split(" ")
		_temp[0] = _temp[0].to_i
		_temp[1] = _temp[1].to_i
		driver_location << _temp
	end
elsif args.length == 3
	map_size = args[0]
	user_x = args[1]
	user_y = args[2]
	driver_count = 5
end
driver_location = []
user_location = [user_x, user_y]
