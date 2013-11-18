module WinCheckerToot
	def self.checkWinCondition(gameBoard)
		#Pre Conditions
		begin
			raise ArgumentError, "WinCheckerToot:: ArgumentError -> Game is over.  Please start a new one." unless gameBoard.endGame == false
		end
		# End Pre Conditions
	end
end