#Ruby Assignment on OOP and file handling
require 'fileutils'
require 'tempfile'
$userObject = nil

module Shop
	def search(productName)
		file_array = getInventoryFileArray
		puts file_array[0]
		for row in file_array
			if product_row = /^\d;#{productName};.*/.match(row)
				puts product_row
			end
		end
		
	end

	def listProducts
		file = getInventory
		puts file.read[0..-1]
	end

	def remove(id)
		file_array = getInventoryFileArray
		temp_file = Tempfile.new("extract")
	end

	def edit(id,name,price,company,stock)
		open("inventory.csv","r") do |mainFile|
			open("tempInventory.csv","a+") do |tempFile|
				mainFile.each_line do |line|
					if line.start_with? id.to_s
						tempFile.puts("#{id};#{name};#{price};#{company};#{stock}")
					else
						tempFile.puts(line)
					end
				end
			end
		end
	end

	def getInventory
		if self.instance_of? Customer
			return File.new("inventory.csv","r")
		elsif self.instance_of? Shopkeeper
			return File.new("inventory.csv","a+")
		end
	end

	def getOrders
		return File.new("orders.csv", "a+")
	end

	def getInventoryFileArray
		file = getInventory
		file_array = file.to_a
	end

	def getOrdersFileArray
		file = getOrders
		file_array = file.to_a
	end
end



class Customer
	include Shop
	def main
		puts "Enter your choice for operation, 1. List Products | 2. Search Product | 3. Buy Product"
		choice = gets.chomp.to_i
		case choice
		when 1
			listProducts
		when 2
			puts "Enter name of the product"
			name = gets.chomp
			search(name)
		when 3
			puts "Enter ID of the product"
			id = gets.chomp.to_i
			buy(id)
		end
	end

	def buy(id)
		inventory_file = getInventoryFileArray
		orders_file = getOrders
		for row in inventory_file
			if product = /^#{id};.*/.match(row)
				puts (product.to_s).split(";").last.to_i - 1 
				orders_file.puts product.to_s
			end
		end
	end
end

class Shopkeeper
	include Shop
	def initialize
		@file = getInventory
	end
	def main
		puts "Enter your choice for operation, 1. Add | 2. Remove | 3. List Products | 4. Search | 5. Edit Product"
		choice = gets.chomp.to_i

		case choice
		when 1
			add
		when 2
			puts "Enter product ID to remove it"
			id = gets.chomp.to_i
			remove(id)
		when 3
			listProducts
		when 4
			puts "Enter name of product to search"
			name = gets.chomp
			search(name)
		when 5
			puts "Enter ID of product to edit"
			id = gets.chomp
			puts "Enter name"
			name = gets.chomp
			puts "Enter price"
			price = gets.chomp
			puts "Enter company"
			comp = gets.chomp
			puts "Enter stock"
			stock = gets.chomp
			edit(id,name,price,comp,stock)
		end
	end

	def add
		puts "Enter product name"
		name = gets.chomp
		puts "Enter price for product"
		price = gets.chomp.to_i
		puts "Enter stock items"
		stock = gets.chomp.to_i
		puts "Enter company name"
		company = gets.chomp
		file_array = @file.to_a
		puts @file.inspect
		id = /^\d/.match(file_array[-1])
		id = id[0].to_i + 1
		@file.puts("#{id};#{name};#{price};#{company};#{stock}")
	end

	
end

puts "May we know you?? | 1. Shopkeeper | 2. Customer"
choice = gets.chomp.to_i

case choice
when 1
	$userObject = Shopkeeper.new
when 2
	$userObject = Customer.new
else
	puts "Sorry, we are unable to identify you, please give proper choice"
end

$userObject.main