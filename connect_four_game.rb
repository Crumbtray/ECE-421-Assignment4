require 'test/unit/assertions.rb'
require './connect_four_game_board'
#require './connect_four_ui'
include Test::Unit::Assertions

class ConnectFourGame
 
	attr_reader :rows, :columns, :gameBoard
	
	def initialize(gameType, row = 6, col = 7)
		# Game Type is either Normal, or TOOT (OTTO)
		#@ui = ConnectFourUI.new(self)
		@rows = row
		@columns = col
		@gameType = gameType
		@gameBoard = ConnectFourGameBoard.new(row, col)
	end

	def move(column)
	    #Pre Conditions
	    begin
			raise ArgumentError, "ConnectFourGameBoard:: ArgumentError -> invalid column." unless (column > 0 and column <= @columns)
		end

		begin
			raise ArgumentError, "ConnectFourGameBoard:: ArgumentError -> Game is over.  Please start a new one." unless @gameBoard.endGame == false
		end
	    #End PreConditions
	    beforeCount = @gameBoard.grid[col].size


	    #Post Conditions
	    assert(@gameBoard.grid[col].size >= beforeCount)
	    #End Post Conditions
	end
	
	def checkWinCondition
		# Pre Conditions
		begin
			raise RuntimeError, "ConnectFourGameBoard:: RuntimeError -> Game is over.  Please start a new one." unless @gameBoard.endGame == false
		end
		# End Pre Conditions

		# Post Conditions
		# Nothing really to put here.  We delegate our win condition checking to the external modules
		# It returns a true or false and:
		# 	- If true, end game.
		# 	- If false, continue game.
		# End Post Conditions
	end
end

game = ConnectFourGame.new("Normal")