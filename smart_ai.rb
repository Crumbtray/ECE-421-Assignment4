class SmartAI
	def initialize
		#Initialize heuristics values from point of view of player and opponent
	end

	#SmartAI uses heuristics to choose its next move
	def makeMove(gameBoard)
		# Pre Conditions
		begin
			raise ArgumentError, "DumbAI:: ArgumentError -> Game is over.  Please start a new one." unless gameBoard.endGame == false
		end
		# End Pre Conditions
		
		#For each column (possible move)
			#Get row heuristics
			#Get column heuristics
			#Get down diagonal heuristics
			#Get up diagonal heurisitics
				
		#Repeat, get heuristics from point of view of opponent
		
		#Choose max valued move compared between the max value of our heuristics and the opponents heuristics
	end
end