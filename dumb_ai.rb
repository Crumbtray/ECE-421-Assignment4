class DumbAI
	def initialize
		# We can instantiate stuff here if need be.
		# Make the AI learn, etc.
	end

	def makeMove(gameBoard)
		# Pre Conditions
		begin
			raise ArgumentError, "DumbAI:: ArgumentError -> Game is over.  Please start a new one." unless gameBoard.endGame == false
		end
		# End Pre Conditions
	end
end