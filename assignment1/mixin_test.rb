module Calculate
	def calulatePercentage
		(@grandTotal.to_f/@total.to_f)*100
	end
	
	def calculateInterest 
		(@principle.to_f*@rate.to_f*@time.to_f)/100
	end
end

class Score
	
	include Calculate

	def initialize(total, grandtotal)
		@total = total
		@grandTotal = grandtotal
	end
end

class Interest
	
	include Calculate

	def initialize(principle, rate, time)
		@principle = principle
		@rate = rate
		@time = time
	end		
end

puts "Enter total marks for exam"
total_marks = gets.chomp.to_f

puts "Enter marks obtained"
marks = gets.chomp.to_f

scoreObj = Score.new(total_marks, marks)
puts scoreObj.calulatePercentage()

puts "Enter principle ammount"
amt = gets.chomp.to_f

puts "Enter rate of interest"
rt = gets.chomp.to_f

puts "Enter time for investment in months"
tim = gets.chomp.to_f

interestObj = Interest.new(amt, rt, tim)
puts interestObj.calculateInterest()


