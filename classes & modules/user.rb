require_relative 'map.rb'

class User
	attr_reader :_loc, :_dest
	attr_writer :_loc
	
	def initialize(arr_xy)
		@_loc = arr_xy
	end
end
