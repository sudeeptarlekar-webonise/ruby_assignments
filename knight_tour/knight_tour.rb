$count = 0
$y_moves = Array[1,-1,2,2,1,-1,-2,-2]
$x_moves = Array[2,2,1,-1,-2,-2,-1,1]


def checkEmptySquare?(x_coord, y_coord)
	displaySolution(4)
	puts "#{x_coord} #{y_coord} in checkEmpty"
	if ($solution[x_coord][y_coord] == -1)
		
		return true
	end
	return false
end

def checkPossibleMove?(x_coord, y_coord, x_move, y_move, n)
	displaySolution(4)
	if ( (x_coord+x_move > n || x_coord+x_move < 0) && (y_coord+y_move > n || y_coord+y_move < 0) )
		puts false
		return false
	else
		puts true
		return true
	end
end

def buildSolution(x_coord, y_coord, n)
	if ($count == n*n)
		displaySolution(n)
                 return true
	end

	$solution[x_coord][y_coord] = 0;
	for move in 0..7
		if (checkPossibleMove?(x_coord, y_coord, $x_moves[move], $y_moves[move], n)==true)
			if (checkEmptySquare?(x_coord+$x_moves[move], y_coord+$y_moves[move])==true)
				$count = $count+1
				if ($count == n*n)
				   displaySolution(n)	
				end
				puts 
				$solution[x_coord+$x_Moves[move]][y_coord+$y_Moves[move]] = $count
				buildSolution(x_coord+$x_moves[move], y_coord+$y_moves[move], n)
				$count = $count-1
			end
		end
	end
        
#  if (checkPossibleMove(x_coord, y_coord, 1
end

def displaySolution(n)
	for i in 0..n-1
		for j in 0..n-1
			print $solution[i][j]
		end
		print "\n"
	end
end

def main
	puts "Enter number of rows"
	board = gets.chomp.to_i
	$solution = Array.new(board){ Array.new(board,-1) }

	buildSolution(0, 0, board)
	displaySolution(board)
end

main()



