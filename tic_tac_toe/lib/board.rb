=begin

Let's write a Tic-Tac-Toe game! Read the entire instructions before getting
started.

* In your `Board` class, you should have a grid instance variable to keep track
  of the board tiles. You should also have the following methods:
  - `place_mark`, which takes a position such as `[0, 0]` and a mark such as :X
    as arguments. It should throw an error if the position isn't empty.
  - `empty?`, which takes a position as an argument
  - `winner`, which should return a mark
  - `over?`, which should return true or false
  - If you want to be a little fancy, read the attached `bracket-methods`
    reading.

=end


class Board

  attr_reader :grid, :marks

  def self.start_blank
    Array.new(3) { Array.new(3)}
  end

  def initialize(grid = Board.start_blank)
    @grid = grid
    @marks = [:X,:O]
  end

  def place_mark(pos,mark)
    raise "NOT VALID MOVE" if @grid[pos[0]][pos[1]] != nil
    @grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]] == nil
  end

  def winner
    return nil if @grid == Array.new(3) { Array.new(3)}
    if horizontal_winner != nil
      horizontal_winner
    elsif diagonal_winner != nil
      diagonal_winner
    elsif vertical_winner != nil
      vertical_winner
    else
      return
    end
  end


  def over?
    grid.flatten.none? { |pos| pos.nil? } || winner
  end

  private

  def horizontal_winner
    idx = 0

    while idx < 3
      first = @grid[idx][0]
      second = @grid[idx][1]
      third = @grid[idx][2]
      arr = [first,second,third]
      if arr.all? {|ele| first == ele && ele != nil}
        return first
      end
      idx+= 1
    end
  end

  def diagonal_winner
    if @grid[0][0] == @grid[1][1] && @grid[0][0] == @grid[2][2]
      return @grid[0][0]
    elsif @grid[0][2] == @grid[1][1] && @grid[0][2] == @grid[2][0]
      return @grid[0][2]
    end
  end

  def vertical_winner
    idx = 0

    while idx < 3
      first = @grid[0][idx]
      second = @grid[1][idx]
      third = @grid[2][idx]
      arr = [first,second,third]
      if arr.all? {|ele| first == ele && ele != nil}
        return first
      end
      idx+= 1
    end
  end


end
