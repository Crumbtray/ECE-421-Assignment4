module WinCheckerToot
	def self.checkWinCondition(gameBoard)
		#Pre Conditions
		begin
			raise ArgumentError, "WinCheckerToot:: ArgumentError -> Game is over.  Please start a new one." unless gameBoard.endGame == false
		end
		# End Pre Conditions
		
		
		anyOpenSpace = false
		for x in 0..gameBoard.colSize - 1
			for y in 0..gameBoard.rowSize - 1
				current = gameBoard.grid[x][y]
				puts "Currently checking cell #{x}, #{y}: #{current}"
				#check if there are any lines
				if(current != nil)
					if(gameBoard.grid[x+1][y] != nil &&
					    current != gameBoard.grid[x+1][y] &&
						gameBoard.grid[x+2][y] != nil &&
						current != gameBoard.grid[x+2][y] &&
						current == gameBoard.grid[x+3][y])
						gameBoard.endGame = true;
						return current;
					end
					if(gameBoard.grid[x][y+1] != nil &&
						current != gameBoard.grid[x][y+1] &&
						gameBoard.grid[x][y+2] != nil &&
						current != gameBoard.grid[x][y+2] &&
						current == gameBoard.grid[x][y+3])
						gameBoard.endGame = true;
						return current;
					end
					if(gameBoard.grid[x+1][y+1] != nil &&
						current != gameBoard.grid[x+1][y+1] &&
						gameBoard.grid[x+1][y+1] != nil &&
						current != gameBoard.grid[x+2][y+2] &&
						current == gameBoard.grid[x+3][y+3])
						gameBoard.endGame = true;
						return current;
					end
					if(gameBoard.grid[x-1][y-1] != nil &&
						current != gameBoard.grid[x+1][y+1] &&
						gameBoard.grid[x-1][y-1] != nil &&
						current != gameBoard.grid[x-2][y-2] &&
						current == gameBoard.grid[x-3][y-3])
						gameBoard.endGame = true;
						return current;
					end
				else
					anyOpenSpace = true
				end
			end
		end
		if(!anyOpenSpace)
			gameBoard.endGame = true;
			return "draw"
		end
	end
end