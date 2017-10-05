=begin
- A `Board` class with an underlying `grid` (a two-dimensional Array),
  where each element in a row represents a ship, open water, or a space
  that has already been attacked. I used the symbol `:s` to represent an
  undamaged ship (or ship segment), `nil` for empty space, and `:x` to
  represent a destroyed space. Useful Board methods:
  - `Board#display`: prints the board, with marks on any spaces that
    have been fired upon.
  - `Board#count`: returns the number of valid targets (ships) remaining
  - `Board#populate_grid` to randomly distribute ships across the board
  - `Board#in_range?(pos)`
=end

class Board
attr_accessor :grid

  def self.default_grid
    Array.new(10) {Array.new(10)}
  end


  def initialize (grid = Board.default_grid)
    @grid = grid
  end



  def count
    counter = 0
    @grid.each do |x|
      x.each do |y|
        counter+= 1 if y == :s
      end
    end

    counter
  end

  def empty?(pos = count == 0 )
    return pos if pos == true || pos == false
    x = pos[0]
    y = pos[1]

    grid[x][y] == nil
  end


  def full?
    count == (grid.length * grid[0].length)
  end


  def place_random_ship
    raise "Board is full" if full?
    coord = random_coord

    until empty?(random_coord)
      coord = random_coord
    end


    grid[coord[0]][coord[1]] = :s
  end

  def full?
    grid.flatten.none?(&:nil?)
  end


  def won?
    grid.flatten.none? {|ele| ele == :s}

  end


  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end


  def [](pos)
    row, col = pos
    grid[row][col]
  end

  private

  def random_coord
    [rand(grid.length), rand(grid.length)]
  end

end
