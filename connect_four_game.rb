require 'test/unit/assertions.rb'
require './connect_four_game_board'
require './connect_four_ui'
include Test::Unit::Assertions

class ConnectFourGame
 
	attr_reader :rows, :columns, :gameBoard
	
	def initialize(gameType, row = 6, col = 7)
		# Game Type is either Normal, or TOOT (OTTO)
		@ui = ConnectFourUI.new(self)
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

	    #Post Conditions
	    assert(@gameBoard)
	    #End Post Conditions
	end
	
	def checkWinCondition

	end
end

game = ConnectFourGame.new("Normal")