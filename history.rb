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
		file.puts "Destination: Mr. ##{@destination}"
		file.puts "Driver: Rp #{@driver_name}"
		file.puts "Price: #{@price}"
		file.print "\n"
	end
end

def history_viewer
	file = File.open("trip_history.txt", "r+")
	print "\n"
	puts file.read
end
