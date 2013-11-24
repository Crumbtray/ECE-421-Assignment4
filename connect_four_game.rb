require 'test/unit/assertions.rb'
require './connect_four_game_board'
require './connect_four_ui'
require './win_checker_normal'
include Test::Unit::Assertions

class ConnectFourGame
 
	attr_reader :rows, :columns, :gameBoard
	
	def initialize(gameType, row = 6, col = 7)
		# Game Type is either Normal, or TOOT (OTTO)
		@rows = row
		@columns = col
		@gameType = gameType
		@gameBoard = ConnectFourGameBoard.new(row, col, "Player 1", "Player 2")
		@ui = ConnectFourUI.new(self)
	end

	def move(player, column)
	    #Pre Conditions
	    begin
			raise ArgumentError, "ConnectFourGameBoard:: ArgumentError -> invalid column." unless (column > 0 and column <= @columns)
		end

		begin
			raise ArgumentError, "ConnectFourGameBoard:: ArgumentError -> Game is over.  Please start a new one." unless @gameBoard.endGame == false
		end
	    
	    #End PreConditions
		
		beforeCount = @gameBoard.grid[column - 1].size

		returnVal = @gameBoard.add(player, column)
	    
	    #Post Conditions
	    assert(@gameBoard.grid[column - 1].size >= beforeCount)
	    #End Post Conditions
	    	
	    return returnVal
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