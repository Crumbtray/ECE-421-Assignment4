class SmartAI
	def initialize
	end

	#SmartAI chooses either a winning move, blocking move, or a move that is the minimal steps away from winning
	def makeMove(gameInstance)
	possibleMoves = Array.new
		gameBoard = gameInstance.gameBoard.clone
		winChecker = gameInstance.winChecker
		
		# Pre Conditions
		begin
			raise ArgumentError, "SmartAI:: ArgumentError -> Game is over.  Please start a new one." unless gameBoard.endGame == false
		end
		# End Pre Conditions
		
		#Determine who our opponent is
		if(gameBoard.player1 == self)
			opponent = gameBoard.player2
		else
			opponent = gameBoard.player1
		end
			
		#Analyse each column (move)
		for move in 0..gameBoard.colSize - 1
			#Check if a move here will cause player to win
			boardCopy = gameBoard.clone
			boardCopy.currentPlayer = self
			boardCopy.add(self, move + 1)
			if(winChecker.checkWinCondition(boardCopy))
				possibleMoves[move] = -1000
				break
			end
			
			#Check if move here will block opponent win
			boardCopy = gameBoard.clone
			boardCopy.currentPlayer = opponent
			boardCopy.add(opponent, move + 1)
			if(winChecker.checkWinCondition(boardCopy))
				possibleMoves[move] = -1000
				break
			end
			
			#Check how many moves away we are from a win here
			possibleMoves[move] = getMoveDepth(gameBoard, winChecker)
		end
		
		#Choose the "best" move (ties broken randomly)
		bestMove = (possibleMoves.each.with_index.find_all{ |a, i| a == possibleMoves.min}.map{|a,b| b}).sample
		return gameInstance.move(self, bestMove)
	end
	
	def getMoveDepth(gameBoard, winChecker)
		#Check if we have made a winning move
		if(winChecker.checkWinCondition(gameBoard))
			return 0
		end
		
		#Check if there are anymore moves to make
		if(gameBoard.endGame == true)
			return 0
		end
		
		possibleMoves = Array.new
		for move in 0..gameBoard.colSize - 1
			if(gameBoard.grid[move].size < gameBoard.colSize)
				boardCopy = gameBoard.clone
				boardCopy.currentPlayer = self
				boardCopy.add(self, move + 1)
				possibleMoves[move] = 1 + getMoveDepth(boardCopy, winChecker)
			end
		end
		
		#Choose the minimum depth (ties broken randomly)
		return (possibleMoves.each.with_index.find_all{ |a, i| a == possibleMoves.min}.map{|a,b| b}).sample
	end
	
	def updateGrid(location, player)

	end
end