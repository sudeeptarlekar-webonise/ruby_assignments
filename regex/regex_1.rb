class RubyParser
	def getVariableCount(filePath)
		if (/.*\.rb/.match(filePath))
			variableHash(File.new(filePath))
		else
			puts "Given file is not ruby file, please enter ruby file. Now exiting"
			exit
		end
	end
	
	def variableHash(fileObj)
		varHash = Hash.new
		varHash = {"Global"=>Array.new, "Class"=>Array.new, "Instance"=>Array.new, "Local"=>Array.new}
		token = 0
		for line in fileObj
			if ( /^\s*(class).*/.match(line) || /^\s*(def)/.match(line) || /[^\w]if/.match(line))
				token = token + 1
			elsif (/end/.match(line))
				token = token - 1
			end

			if (loc = /\w+\s*=/.match(line))
				if matchData?(varHash["Local"], loc.to_s)
					varHash["Local"] = varHash["Local"].push(loc.to_s)
				end	
			elsif (cls = /@@\w+\s*=/.match(line))
				if matchData?(varHash["Class"], cls.to_s)
					varHash["Class"] = varHash["Class"].push(cls)
				end
			elsif (glo = /\$\w+\s*=/.match(line))
				if matchData?(varHash["Global"], glo.to_s)
					varHash["Global"] = varHash["Global"].push(glo)
				end
			elsif (inst = /@\w+\s*=/.match(line))
				if matchData?(varHash["Instance"], isnt.to_s)
					varHash["Instance"] = varHash["Instance"].push(inst)
				end
			end
			puts "#{line} #{token}"
		end
		#puts varHash
	end
	
	def matchData?(array, line)
		for data in array
			if data.to_s == line.to_s
				return false
			end
		end
		return true
	end
end

puts "Enter path for ruby file"
filePath = gets.chomp
hash = RubyParser.new.getVariableCount(filePath)
puts "Global variables : #{(hash["Global"]).size}"
puts "Class variables : #{(hash["Class"]).size}"
puts "Instance variables : #{(hash["Instance"]).size}"
puts "Local variables : #{(hash["Local"]).size}"

