require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

=begin
* In your `Game` class, set the marks of the players you are passed. Include
  the following methods:
  - `current_player`
  - `switch_players!`
  - `play_turn`, which handles the logic for a single turn
  - `play`, which calls `play_turn` each time through a loop until the game is
    over
=end

class Game
attr_accessor :current_player, :player1, :player2, :board

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2

    player1.mark = :O
    player2.mark = :X

    @current_player = player1
    @board = Board.new
  end


  def play
    current_player.display(board)

    until board.over?
      play_turn
    end

    if game_winner
      game_winner.display(board)
      puts "#{game_winner.name} wins!"
    else
      puts "Cat's game"
    end
  end

  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def game_winner
    return player1 if board.winner == player1.mark
    return player2 if board.winner == player2.mark
    nil
  end

  def switch_players!
    self.current_player = current_player == player1 ? player2 : player1
  end


end
