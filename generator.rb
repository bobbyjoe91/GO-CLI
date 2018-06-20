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
	
	def Generate.random_array(amount, limit) #generate unsorted array with range 0 to limit-1
 		array = Array.new(amount){-1}
		for i in 0...amount
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
