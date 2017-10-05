# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  sorted = arr.sort
  return sorted[-1] - sorted[0]
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  sorted = arr.sort
  return sorted == arr
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  vowels = "aeiouAEIOU"
  counter = 0

  i = 0
  while i < str.length
    if vowels.include?(str[i])
      counter += 1
    end
    i += 1
  end
  return counter
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  vowels = "aeiouAEIOU"
  result = ""

  i = 0
  while i < str.length
    if !vowels.include?(str[i])
      result += str[i]
    end
    i += 1
  end
  return result
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  split = int.to_s.split("").sort.reverse
  return split
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  i = 0
  while i < str.length
    if str.count(str[i]) + str.count(str[i].upcase) >= 2
      return true
    end
    i += 1
  end
  return false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  joined = arr.join
  result = "(" + joined[0..2] + ") " + joined[3..5] + "-" + joined[6..9]
  return result
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  split = str.split(",").sort
  return split[-1].to_i - split[0].to_i
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  result =[]
  result.concat(arr.drop(offset) + arr.take(offset))
  return result
end
