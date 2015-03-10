$pi = 3.14159265359


module Circle
	def calculateArea
		$pi * (@radius ** 2)
	end
end

class CircleCalculations
	include Circle

	def initialize(radius)
		@radius = radius
	end
end

puts "Enter radius of circle"
rad = gets.chomp.to_f

circleObj = CircleCalculations.new(rad)

puts circleObj.calculateArea()
