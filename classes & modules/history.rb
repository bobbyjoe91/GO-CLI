require 'date'

class History
	attr_reader :time
	#history writer to trip_history.txt
	def initialize(ride)
		@time = Time.now.strftime('%A, %d %b %Y, %H:%M:%S')
		@driver_name = Exchange::driver(ride)
		@price = Exchange::price(ride)
		@destination = Exchange::destination(ride)
		@from = Exchange::from(ride)
		@route = Exchange::route(ride)
		
		file = File.open("classes & modules/trip_history.txt", "a+")
		file.print "Order time: #{@time}\n"
		file.puts "From: #{@from}"
		file.puts "Destination: #{@destination}"
		file.puts "Driver: Mr. ##{@driver_name}"
		file.puts "Route: "
		file.print @route
		file.puts "Price: Rp #{@price}"
		file.print "\n"
		file.close
	end
end

def history_viewer
	print "\n"
	file = File.open("classes & modules/trip_history.txt", 'r')
	while !file.eof?
		line = file.readline
		puts line
	end
end

def history_eraser
	File.open("classes & modules/trip_history.txt", 'w') {|file| file.truncate(0) }
end
