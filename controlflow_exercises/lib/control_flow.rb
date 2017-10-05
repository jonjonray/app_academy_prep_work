# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
result = ""
idx = 0

while idx < str.length
  lower = str[idx].downcase
  if lower != str[idx]
    result += str[idx]
  end
  idx += 1
end

return result

end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  mid_idx = str.length / 2
  if (str.length.even?)
    return str[mid_idx - 1] + str[mid_idx]
  else
    return str[mid_idx.floor]
  end

end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
result = 0
idx = 0
while idx < VOWELS.length
  if str.include? VOWELS[idx]
    result += 1
  end

  idx += 1
end

return result

end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)

result = 1
idx = 1
while idx <= num
result = result * idx

idx += 1
end

return result
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")

result = ""

idx = 0
while idx < arr.length

  if idx != arr.length - 1
    result += arr[idx] +  separator
  else
    result += arr[idx]
  end

idx += 1
end

return result

end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
result = ""

idx = 0
while idx < str.length
  num = idx + 1
  if num.even?
    result += str[idx].upcase
  else
    result += str[idx].downcase
  end

  idx += 1

end
  return result

end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
result = []
words = str.split(" ")
idx = 0
  while idx < words.length
  word = words[idx]
  if word.length >= 5
    result.push(word.reverse!)
  else
    result.push(word)
  end

  idx += 1

  end

return result.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  result = []

  idx = 1
  while idx <= n
    if idx % 3 == 0 && idx % 5 != 0
      result.push("fizz")
    elsif idx % 3 != 0 && idx % 5 == 0
      result.push("buzz")
    elsif idx % 3 == 0 && idx % 5 == 0
      result.push("fizzbuzz")
    else
      result.push(idx)
    end

    idx += 1
  end

return result

end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  result = []

  arr.each do |ele|
    result.unshift(ele)
  end

  return result

end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num < 2
    return false
  else
    idx = 2
    while idx < num
      if num % idx == 0
        return false
      end
      idx += 1
    end
  end

    return true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  result = []

  idx = 1
  while idx <= num
    if num % idx == 0
      result.push(idx)
    end
    idx += 1
  end
  return result.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  result = []

  idx = 1
  while idx <= num
    if num % idx == 0 && prime?(idx)
      result.push(idx)
    end
    idx += 1
  end

  return result.sort

end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)

factors = prime_factors(num)

return factors.length

end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)

even =[]
odd = []

arr.each do |ele|
  if ele.odd?
    odd.push(ele)
  else
    even.push(ele)
  end
end

if even.length == 1
  return even[0]
elsif odd.length == 1
  return odd[0]
end

end
