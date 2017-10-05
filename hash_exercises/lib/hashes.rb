# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  words = str.split(" ")
  word_length = Hash.new(0)
  words.each {|ele| word_length[ele] = ele.length}
  word_length
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  nested_array = hash.sort_by {|k,v| v}
  nested_array[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k,v|
    older[k] = v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  letters = word.split("")
  letter_hash = Hash.new(0)
  letters.each {|char| letter_hash[char]+= 1}
  letter_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  count = Hash.new(0)
  arr.each {|ele| count[ele]+= 1}
  count.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  result_hash = {:even => 0, :odd => 0}
  numbers.each do |ele|
    if ele % 2 == 0
      result_hash[:even]+= 1
    else
      result_hash[:odd]+= 1
    end
  end
  result_hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels_hash = {"a" => 0 ,"e" => 0,"i" => 0,"o" => 0,"u" => 0}
  chars = string.split("")
  chars.each do |char|
    if vowels_hash[char] != nil
      vowels_hash[char] += 1
    end
  end
  sorted = vowels_hash.sort_by {|k,v| v}.last.first
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  latter_half = students.select {|k,v| v > 6}
  student_arr= latter_half.keys
  result = []
  idx1 = 0
  while idx1 < student_arr.length
    idx2 = idx1 + 1
    while idx2<student_arr.length
      result.push([student_arr[idx1],student_arr[idx2]])
      idx2 += 1
    end
    idx1+= 1
  end

  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  index_hash = Hash.new(0)
  specimens.each {|ele| index_hash[ele]+= 1}
  sorted_index = index_hash.sort_by {|k,v| v}
  index_hash.length**2 * sorted_index[0][1] / sorted_index[-1][1]
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_count = character_count(normal_sign)
  vandal_count = character_count(vandalized_sign)
  vandal_count.each do |k,v|
    if normal_count[k] < v
      return false
    end
  end
  return true
end

def character_count(str)
  result = Hash.new(0)
  chars = str.split("")
  chars.each {|char| result[char.downcase] += 1}
  result
end
