require_relative 'map.rb'

class User
	attr_reader :_loc, :_dest
	attr_writer :_loc
	
	def initialize(arr_xy)
		@_loc = arr_xy
	end
	def destination=(arr_ij)
		@_dest = arr_ij
	end
end
