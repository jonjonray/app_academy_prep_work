# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi


  def initialize
    @towers = [[3,2,1],[],[]]
  end


  def play
    until won?
      print "What is your next move?"
      print "Move from:"
      old_tower = gets
      print "Move to:"
      new_tower = gets
      move(old_tower.to_i,new_tower.to_i)
    end
    puts "CONGRATULATIONS. VICTORY IS YOURS!"
  end


  def towers
    @towers
  end

  def move(old_tower,new_tower)
    raise "NOT VALID MOVE. START AGAIN" if valid_move?(old_tower,new_tower) != true
    disc = @towers[old_tower].pop
    @towers[new_tower].push(disc)
    render
  end

  def valid_move?(old_tower,new_tower)
    if @towers[new_tower].empty?
      return true
    elsif @towers[old_tower].empty?
      return false
    elsif @towers[old_tower][-1] < @towers[new_tower][-1]
      return true
    else
      return false
    end
  end

  def won?
    @towers[2] == [3,2,1] || @towers[1] == [3,2,1]
  end

  def render
    print @towers
  end

end
