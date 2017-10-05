class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end


  def setup
    length = referee.pick_secret_word
    guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess = @guesser.guess(@board)
    indices = @referee.check_guess(guess)
    update_board(guess,indices)
    @guesser.handle_response(guess,indices)
  end


  def update_board(letter,indices)
    indices.each {|idx| @board[idx] = letter}
  end

end

class HumanPlayer
  

end

class ComputerPlayer

  attr_reader :dictionary, :secret_word,:secret_length
  attr_accessor :candidate_words


  def initialize(dictionary)
    @dictionary = dictionary
  end

  def register_secret_length(length)
    @candidate_words = @dictionary.select { |word| word.length == length }
  end

  def pick_secret_word
    @secret_word = dictionary[rand(dictionary.length)]
    secret_word.length
  end


  def guess(board)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
    letter = max_value_letter(board)

    letter
  end

  def check_guess(letter)
    result = []
    secret_word.split("").each_with_index {|char,idx| result << idx if char == letter}
    result
  end


  def handle_response(guess, response_indices)
    @candidate_words.reject! do |word|
      toggle = false

      word.split("").each_with_index do |letter, index|
        if (letter == guess) && (!response_indices.include?(index))
          toggle = true
          break
        elsif (letter != guess) && (response_indices.include?(index))
          toggle = true
          break
        end
      end

      toggle
    end
  end


  def candidate_word_frequency(board)
    frequency_values = Hash.new(0)
    @candidate_words.each do |word|
      board.each_with_index do |char,idx|
        frequency_values[word[idx]]+= 1 if char.nil?
        end
      end


    frequency_values
  end

  def max_value_letter(board)
    letter = nil
    number = 0
    hash_values = candidate_word_frequency(board)
    hash_values.each do |k,v|
      if v > number && board.include?(k) != true
         number = v
         letter = k
       end
    end

    letter
  end

end
