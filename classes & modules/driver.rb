require_relative 'generator.rb'

class Driver
	include Generate
	attr_accessor :locations
	
	def initialize(locations)
		@locations = locations
	end
end
