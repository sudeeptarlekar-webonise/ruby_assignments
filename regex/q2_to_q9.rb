class Functionality
	#Function to check whether string contains 'ss' pattern
	def ssPattern?(string)
		if /ss/.match(string)
			return true
		end
		return false
	end
	
	#To get third word from string
	def getThirdWord(string)
		(string[/\s*\w+\s+\w+\s+\w+/]).split(" ")[-1]
	end
	
	#function to replace Mrs with Ms
	def replaceSubStr(string)
		string.gsub(/Mrs/,'Ms')
	end
	
	#function to check whether string entered starts with 'St'
	def startWith?(string)
		if string[/^(\s*St)/]
			return true
		end
		return false
	end
	
	#function to check whether string given ends with 'art'
	def endsWith?(string)
		if string[/(art\s*)$/]
			return true
		end
		return false
	end
	
	#function to check whether string contains non-alphnumeric character
	def isNonAlphanumeric?(string)
		if string[/[^a-zA-Z0-9/]
			return true
		end
		return false
	end

	#fucntion to check whether string contains white spaces or not
	def isWhiteSpace?(string)
		if string[/\s*/]
			return true
		end
		return false
	end
	
	#function to replace non-alphnumeric characters
	def replaceNonAlphanumeric(string)
		string.gsub("/[^A-Za-z0-9]/","-")
	end
	
end
