require './connect_four_game_board'
require './connect_four_ui'

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

	def move(col)
	    puts "Player tried to add a marker to column #{col}."
	end
	
	def checkWinCondition

	end
end

game = ConnectFourGame.new("Normal")