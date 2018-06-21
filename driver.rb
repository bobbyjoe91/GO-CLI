require_relative 'generator.rb'

class Driver
	include Generate
	attr_reader :locations, :driver
	#initialize n*2 array of drivers
	@@names = ["Anto","Benny","Chika","Darius","Echa","Farah","Gina","Hilman"]
	
	def initialize(locations)
		#generate random x,y of driver
		@locations = locations
	end
end
