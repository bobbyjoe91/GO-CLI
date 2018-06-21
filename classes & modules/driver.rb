require_relative 'generator.rb'

class Driver
	include Generate
	attr_reader :locations, :driver
	
	def initialize(locations)
		@locations = locations
	end
end
