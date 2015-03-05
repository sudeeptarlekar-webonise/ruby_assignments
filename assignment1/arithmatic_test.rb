def arithmaticOperation(operand1,operand2,operator)
	if operator == "+"
		return operand1.to_i + operand2.to_i
	elseif operator == "-"
		return operand1.to_i - operand2.to_i
		
	elseif operator == "*"
		return operand1.to_i * operand2.to_i
		
	else
		return operand1.to_i / operand2.to_i
	end
end

begin
	puts "Enter first number"
	operand1 = gets.chomp.to_i
	
	puts "Enter second number"
	operand2 = gets.chomp.to_i

	puts "Enter operation you want to perform"
	operator = gets.chomp
	
	puts arithmaticOperation(operand1,operand2,operator)
	
end
