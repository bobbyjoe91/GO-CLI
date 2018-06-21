module Generate
	def Generate.random_xy(limit)
		coord = [0,0]
		token = Array.new(limit){|num| num+1}
		coord[0], coord[1] = token.sample, token.sample
		return coord
	end
	
	def Generate.random_num(limit) #random index generator
		num = -1
		n = Array.new(limit){num+=1}
		return n.sample
	end
end

