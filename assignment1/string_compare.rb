
	def compareStrings(string1, string2)
		return string1 === string2
	end


begin
	puts "Give first string to comapre"
	string1 = gets.chomp

	puts "Give second string to compare"
	string2 = gets.chomp
	
	if compareStrings(string1,string2)
		puts "Two entered string are same"
	else
		puts "Two strings are not same"
	end
	
end
