require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0) {|acc,ele| acc + ele}
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_string? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? {|ele| sub_string?(ele,substring) }
end


def sub_string? (word,substring)
  word.include?(substring)
end
# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  split = string.split(" ").join("").split("")
  result = split.select {|ele| split.count(ele) >= 2}
  result.uniq.sort
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)

  string.delete(".,!:")
  string.split(" ").sort_by {|ele| ele.length}[-2..-1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  all_letters = "abcdefghijklmnopqrstuvwxyz"

  split = string.split("")

  split.each {|char| all_letters.delete!(char)}
  all_letters.split("")
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select do |yr|
    not_repeat_year?(yr)
  end
end

def not_repeat_year?(year)
  year_digits = year.to_s.split("")
  year_digits == year_digits.uniq
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  uniq_songs =  songs.uniq
  uniq_songs.select {|ele| no_repeats?(ele,songs)}
end

def no_repeats?(song_name, songs)
  songs.each_with_index do |ele,idx|
    if ele == song_name
      return false if ele == songs[idx+1]
    end
  end
  return true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  words = string.delete(".,:;!?").split(" ")
  no_c = words.select {|ele| c_distance(ele) > -1}
  mapper = no_c.map {|ele| c_distance(ele)}
  no_c[mapper.index(mapper.min)]
end

def c_distance(word)
  letters = word.split("")
  idx = letters.length - 1
  while idx >= 0
    if letters[idx].downcase == "c"
      return letters.length - (idx + 1)
    end
    idx-= 1
  end

  return -1
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  result = []
  int_idx = nil

  arr.each_with_index do |ele,idx|
    next_ele = arr[idx+1]
    if ele == next_ele
      int_idx = idx unless int_idx
    elsif int_idx
      result.push([int_idx,idx])
      int_idx = nil
    end
  end
  result
end
