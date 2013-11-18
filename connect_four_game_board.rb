require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class ConnectFourGameBoard

	attr_reader :grid, :rowSize, :colSize
	attr_accessor :endGame

	def initialize(rows, columns)
		@grid = Array.new
		@rowSize = rows
		@colSize = columns
		@endGame = false

		for i in 0..columns - 1
			@grid << Array.new
		end
	end

	def add(player, column)
		# Pre Conditions
		begin
			raise ArgumentError, "ConnectFourGameBoard:: ArgumentError -> invalid column." unless (column > 0 and column <= colSize)
		end

		begin
			raise ArgumentError, "ConnectFourGameBoard:: ArgumentError -> Game is over.  Please start a new one." unless @endGame == false
		end
		# Pre Conditions End

		zeroIndexColumn = column - 1
		if(@grid[zeroIndexColumn].size < colSize)
			@grid[zeroIndexColumn].push(player)
			return @grid
		else
			puts "Invalid move: Column is full."
			return @grid
		end

		# Post Conditions
		
		# End Post Conditions
	end

end