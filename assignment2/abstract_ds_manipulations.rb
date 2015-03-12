module Operations
	def getSize
		self.size()
	end

	def showElements
		self.to_s
	end
end

class Array
	include Operations

	def addElement
		puts "type done when you are finished with input"
		while true
			@ele = gets.chomp
			if @ele == "done"
				break
			end
			self.push(@ele)
		end
	end
end

class Hash
	include Operations

	def addElement
	 puts "Enter key"
	 @key = gets.chomp
	 puts "Enter value"
	 @value = gets.chomp
	 self[@key] = @value	
	end
	
	def getKeys
	 self.keys
	end
end

puts "1. Array | 2. Hash | 3. String"
choice = gets.chomp.to_i
userOps = nil
case choice
	when 1
		userOps = Array.new
	when 2
		userOps = Hash.new
	when 3
		userOps = String.new
	else "Enter correct choice"
end


userOps.addElement()

if userOps.instance_of? Hash
 puts userOps.getKeys()
end

puts userOps.showElements()
puts userOps.getSize()

