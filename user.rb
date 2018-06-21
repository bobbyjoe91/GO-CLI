require_relative 'map.rb'

class User
	attr_reader :_loc, :_dest
	def initialize(arr_xy)
		@_loc = arr_xy
	end
	def set_destination(arr_ij)
		@_dest = arr_ij
	end
end
