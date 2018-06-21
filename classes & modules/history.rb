require 'date'

class History
	attr_reader :time
	
	def initialize(ride)
		@time = Time.now.strftime('%A, %d %b %Y, %H:%M:%S')
		@driver_name = Exchange::driver(ride)
		@price = Exchange::price(ride)
		@destination = Exchange::destination(ride)
		file = File.open("trip_history.txt", "a+")
		file.puts "Order time: #{@time}"
		file.puts "Destination: #{@destination}"
		file.puts "Driver: Mr. ##{@driver_name}"
		file.puts "Price: Rp #{@price}"
		file.print "\n"
		file.close
	end
end

def history_viewer
	file = File.open("trip_history.txt", 'r')
	while !file.eof?
		line = file.readline
		puts line
	end
end
