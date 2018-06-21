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
	def Command.help
		puts "\n                         GO-CLI's guide for user"
		puts "\nshow map -- shows map indicating user's (V) and drivers'(O) location"
		puts "reload map -- rerandomize drivers position"
		puts "order go ride -- allocates nearest driver to give user a lift"
		puts "view history -- shows all trip user had made"
		puts "clear history -- clean history"
		puts "exit \\ quit -- close GO-CLI"
		puts "about -- about developer"
		puts "\n--------------------------------------------------------------------------------"
	end
	def Command.about
		puts "\nGO-CLI 1.0.0"
		puts "Developed by Bobby Jonathan", "for SEA COMPFEST X 2nd assignment"
		puts "Since 2018"
		puts "---------------", "Found a bug? Contact me", "bobby.cool00763@gmail.com", "---------------"
	end
	def Command.reload_map(driver_count, map_size)
		driver_location = []
		for i in 0...driver_count
			driver_location << Generate::random_xy(map_size-1)
		end
		return driver_location
	end
end
