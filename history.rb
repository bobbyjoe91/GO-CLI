require 'date'

class History
	attr_reader :time
	
	@@counter = 0
	def initialize(ride)
		@time = Time.now.strftime('%A, %d %b %Y, %H:%M:%S')
		@driver_name = Exchange::driver(ride)
		@price = Exchange::price(ride)
		@@counter += 1
		
		
	end
end

def history_viewer
	file = File.open("trip_history.txt", "r")
	print "\n"
	puts file.read
end
