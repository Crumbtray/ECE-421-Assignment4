require './connect_four_game_board'


class ConnectFourGame

	def initialize(gameType)
		# Game Type is either Normal, or TOOT (OTTO)


		@gameType = gameType
		@gameBoard = ConnectFourGameBoard.new(6, 7)
	end

	def checkWinCondition

	end

end