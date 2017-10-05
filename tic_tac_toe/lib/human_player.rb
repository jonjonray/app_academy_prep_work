=begin

* In your player classes, have an instance variable `mark` that the game will
  set on initialize.

* In your `HumanPlayer` class,
  - `display` should print the board out to the console
  - `get_move` should allow the player to enter a move of the form '0, 0', and
    return it as a position of the form `[0, 0]`

=end


class HumanPlayer

attr_reader :name
attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)

    first_row = board.grid[0][0].to_s + " | " +  board.grid[0][1].to_s + " | " + board.grid[0][2].to_s

    second_row = board.grid[1][0].to_s + " | " + board.grid[1][1].to_s + " | " + board.grid[1][2].to_s

    third_row = board.grid[2][0].to_s + " | " + board.grid[2][1].to_s + " | " + board.grid[2][2].to_s

    puts first_row
    puts "-----------------"
    puts second_row
    puts "-----------------"
    puts third_row
  end

  def get_move
    puts "Where are you going to move next?"
    gets.chomp.split(",").map {|ele| ele.to_i}
  end

end
