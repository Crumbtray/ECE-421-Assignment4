require 'test/unit/assertions.rb'
require './connect_four_game_board'
require './win_checker_normal'
include Test::Unit::Assertions

class ConnectFourGame
 
	attr_reader :rows, :columns, :gameBoard
	
	def initialize(winChecker, player1, ai)
		# Game Type is either Normal, or TOOT (OTTO)
		puts "Player1: #{player1}"
		puts "GameType: #{winChecker}"
		@player1 = player1
		@player2 = ai
		@winChecker = winChecker
		@gameBoard = ConnectFourGameBoard.new(6, 7, player1, ai)
	end

	def move(player, column)
	    #Pre Conditions
		begin
			raise ArgumentError, "Game is over.  Please start a new one." unless @gameBoard.endGame == false
		end

		begin
			raise ArgumentError, "Column is full.  Please choose another column." unless @gameBoard.grid[column - 1].size < @gameBoard.rowSize
		end
	    
	    #End PreConditions
		
		beforeCount = @gameBoard.grid[column - 1].size

		returnVal = @gameBoard.add(player, column)
	    
	    #Post Conditions
	    assert(@gameBoard.grid[column - 1].size >= beforeCount)
	    #End Post Conditions
	    	
	    return returnVal
	end

	def endTurn(player)
	    #Pre Conditions
		begin
			raise ArgumentError, "Game is over.  Please start a new one." unless @gameBoard.endGame == false
		end
	    #End PreConditions

	    potentialWinner = @winChecker.checkWinCondition(@gameBoard)
	    if(@gameBoard.endGame == true)
	    	puts @player1
	    	@player1.endGame(potentialWinner)
	    end


	end
	
	def checkWinCondition
		# Pre Conditions
		begin
			raise RuntimeError, "Game is over.  Please start a new one." unless @gameBoard.endGame == false
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