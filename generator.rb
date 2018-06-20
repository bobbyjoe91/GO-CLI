module Generate
	def Generate.random_xy(limit)
		coord = [0,0]
		token = Array.new(limit){|num| num+1}
		coord[0], coord[1] = token.sample, token.sample
		
		return coord
	end
	
	def Generate.random_num(limit)
		n = Array.new(limit){|num| num+1}
		return n.sample
	end
	
	def Generate.random_array(amount, limit)
		array = Array.new(amount){0}
		for i in 0..amount-1
			tmp = Generate::random_num(limit)
			if !array.include?(tmp)
				array[i] = tmp
			else
				while array.include?(tmp)
					tmp = Generate::random_num(limit)
				end
				array[i] = tmp
			end
		end
		
		return array
	end
end

