require_relative 'generator.rb'

class Driver
	include Generate
	attr_reader :locations, :driver
	#initialize n*2 array of drivers
	@@names = ["Anto","Benny","Chika","Darius","Echa","Farah","Gina","Hilman"]
	
	def initialize(n, map_limit)
		#generate random x,y of driver
		@locations = Array.new(n)
		@driver = {}
		for i in 0..n-1
			@locations[i] = Generate::random_xy(map_limit)
		end
		lottery = Generate::random_array(n, 7)
		for i in 0..n-1
			@driver[@locations[i]] = @@names[lottery[i]]
		end
	end
end
