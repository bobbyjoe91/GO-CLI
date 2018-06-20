require_relative 'map.rb'

class User
	def initialize(x, y)
		@x = x
		@y = y
	end
	def set_destination(i, j)
		@i = i
		@j = j
	end
end
