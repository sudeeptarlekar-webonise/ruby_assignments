
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
			if ( /^\s*(class).*/.match(line) || /^\s*(def)/.match(line))
				 token = token + 1
			elsif (/^(end)/.match(line))
				token = token - 1
			end
			if (/^[\w|\s]+=/.match(line))
				
				#varHash["Local"] = varHash["Local"].to_i + 1
			elsif (/@@[\w|\w\s]*=[\s\w|\w]+.*/.match(line) && token != 0)
				varHash["Class"] = varHash["Class"].to_i + 1
			elsif (/\$\w+\s*=\s*[\w|\d]+/.match(line))
				varHash["Global"] = varHash["Global"].to_i + 1
					
			end
		end
		puts varHash
	end
end

puts "Enter path for ruby file"
filePath = gets.chomp
RubyParser.new.getVariableCount(filePath)

