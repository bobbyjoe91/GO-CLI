require_relative 'go_ride.rb'

class History
	@@counter = 0
	def initialize()
		
	end
	def showHistory
		
	end
	def writeHistory(bool = false)
		_bool = Confirm.new(bool)
		if _bool.trigger == true
		
		end
	end
	def self.counter
		return @@counter
	end
end

require 'date'

class Confirm
	attr_reader :bool

	def initialize(bool = false)
		@trigger = bool
	end
end
