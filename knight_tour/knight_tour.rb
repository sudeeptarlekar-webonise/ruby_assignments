$count = 0
$y_moves = Array[1,-1,2,2,1,-1,-2,-2]
$x_moves = Array[2,2,1,-1,-2,-2,-1,1]


def checkEmptySquare?(x_coord, y_coord)
	puts $solution.inspect
	if ( $solution[x_coord][y_coord] == -1)
		return true
	end
	return false
end

def checkPossibleMove?(x_coord, y_coord, x_move, y_move, n)
	if ( (x_coord+x_move > n || x_coord+x_move < 0) && (y_coord+y_move > n || y_coord+y_move < 0) )
		return true
	end
	return false
end

def buildSolution(x_coord, y_coord, n)
	if ($count == n*n)
		return
	end

	$solution[x_coord][y_coord] = 0;
	for move in 0..7
		if (checkPossibleMove?(x_coord, y_coord, $x_moves[move], $y_moves[move], n))
			if (checkEmptySquare?(x_coord+$x_moves[move], y_coord+$y_moves[move]))
				$count = $count+1
				if ($count == n*n)
					break
				end
				$solution[x_coord][y_coord] = $count
				buildSolution(x_coord+$x_moves[move], y_coord+$y_moves[move], n)
				$count = $count-1
			end
		end
	end
#  if (checkPossibleMove(x_coord, y_coord, 1
end

def displaySolution(n)
	for i in 0..n
		for j in 0..n
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



