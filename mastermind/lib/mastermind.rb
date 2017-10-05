class Code
  attr_reader :pegs

  PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :orange,
    "P" => :purple
  }

  def initialize(pegs)
    @pegs = pegs
  end


  def self.parse(string)
    pegs = string.split("").map do |char|
      raise "not valid color" if PEGS.has_key?(char.upcase) == false

      PEGS[char.upcase]
    end

    Code.new(pegs)

  end


  def self.random
    default_colors = [:blue,:green,:blue,:yellow,:orange,:purple]
    result = []
    4.times {result << default_colors.sample}
    Code.new(result)
  end


  def [](idx)
    pegs[idx]
  end


  def exact_matches(colors)
    counter = 0
    self.pegs.each_with_index {|color,idx| counter+= 1 if color == colors.pegs[idx]}
    counter
  end

  def near_matches(colors)
    counter = 0
    checked = []
    self.pegs.each_with_index do |color,idx|
      if colors.pegs.include?(color) && checked.include?(color) != true
        counter+= 1
        checked << color
      end
    end

    counter - exact_matches(colors)
  end


  def == (colors)
    return false if colors.class != Code
    self.pegs == colors.pegs
  end

end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def get_guess
  puts "What is your guess?"
  attempt = gets.chomp
  Code.parse(attempt)
  end


  def display_matches(attempt)
  exact = @secret_code.exact_matches(attempt)
  near = @secret_code.near_matches(attempt)

  puts "exact: #{exact}"
  puts "near: #{near}"
  end


end
