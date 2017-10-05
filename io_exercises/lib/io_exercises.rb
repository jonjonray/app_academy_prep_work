# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.


def guessing_game
  number_of_guesses = 0
  guesses = []
  right_number = 1 + rand(100)
  current_guess = 0
  until current_guess == right_number
    puts "Guess a number"
    guess = gets.chomp
    current_guess = guess.to_i
    if current_guess > right_number
      puts current_guess
      puts "too high"
    elsif current_guess < right_number
      puts current_guess
      puts "too low"
    end

    number_of_guesses+= 1
  end

  puts "Congrats, you guessed the right number, which was #{right_number}."
  puts "It took #{number_of_guesses} guesses."
  puts "Your previous guesses were #{guesses}"
end
