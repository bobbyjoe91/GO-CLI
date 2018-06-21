require_relative 'go_ride.rb'

require 'date'

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
