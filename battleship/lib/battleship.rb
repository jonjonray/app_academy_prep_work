class BattleshipGame
  attr_reader :board, :player


  def initialize(player,board)
    @player = player
    @board = board
  end

  def attack(coord)
    board[coord] = :x
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    move = player.get_play

    attack(move)
  end

end
