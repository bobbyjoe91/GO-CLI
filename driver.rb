require_relative 'generator.rb'
require_relative 'map.rb'

class Driver
	include Generate
	#initialize n*2 array of drivers
	@@names = ["Anto","Benny","Chika","Darius","Echa","Farah","Gina","Hilman"]
	
	def initialize(n = 5)
		@location = Array.new(n){Array.new(2){0}}
		@driver = {}
	end
	def self.names(index = -1)
		if index == -1
			return @@names
		else
			return @@names[index]
		end
	end
end

