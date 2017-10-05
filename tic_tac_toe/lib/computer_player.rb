class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

    def initialize(name)
      @name = name
    end

    def display(board)
      @board = board
    end

    def get_move
      all_moves = []
      (0..2).each do |row|
        (0..2).each do |col|
          play = [row,col]
          all_moves << play if board.grid[row][col].nil?
        end
      end


      all_moves.each do |move|
        if winner?(move)
          return move
        end
      end

      all_moves.sample
    end



    def winner?(move)
      board.grid[move[0]][move[1]] = @mark
      if board.winner != nil
        board.grid[move[0]][move[1]] = nil
        return true
      else
        board.grid[move[0]][move[1]] = nil
        false
      end
    end


end
