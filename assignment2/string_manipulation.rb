$array = Array.new()

class StringManipulation
	def initialize(str)
		@String = str
	end

	def deleteChars
		@tempStr = @String
		for j in 0..@tempStr.length
			
			for i in 0..@tempStr.length
				unless (i+1)%2 == 0
					$array.push(@tempStr[i])
				end
			end
			@tempStr = $array.join
			puts @tempStr
			
			if @tempStr.length == 1
				break
			end
			$array = Array.new()
		end
	end
end

puts "Enter String"
str = gets.chomp

strManObj = StringManipulation.new(str)
strManObj.deleteChars()

