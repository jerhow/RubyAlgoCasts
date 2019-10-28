# // --- Directions
# // Print out the n-th entry in the fibonacci series.
# // The fibonacci series is an ordering of numbers where
# // each number is the sum of the preceeding two.
# // For example, the sequence
# //  [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# // forms the first ten entries of the fibonacci series.
# // Example:
# //   fib(4) === 3

# An iterative solution
#
# This solution stores the entire sequence up to n in an array
# and returns the last element. O(n) linear time.
def fib1(n)
  fibs = [0, 1]
  ( 0..(n-1) ).each { |idx|
    next if fibs[idx] < 1
    fibs << fibs[idx] + fibs[idx - 1]
  }
  fibs.last
end

# A recursive solution
#
# This solution gets dramatically slower for larger values of n.
# When you graph out the calls, the tree grows nearly exponentially.
# I'm not entirely sure what runtime complexity this falls into,
# but I see it as being slightly less than O(n^2) quadratic.
def fib2(n)
  if n < 2
    n
  else
    fib2(n - 1) + fib2(n - 2)
  end
end

# A recursive solution, memoized
#
# This should be no worse than O(n) linear time, since at worst 
# you have to call fib3 n times to memoize it down the line 
# (5, 4, 3, 2, etc).
# However, once you are able to hit the cache for a given value of n,
# your lookups improve to O(1) constant time.
def fib3(n, cache = {})
  return cache[n] if cache[n]

  fib_num = n < 2 ? n : fib3(n - 1, cache) + fib3(n - 2, cache)
  cache[n] = fib_num

  return fib_num
end

p fib1(2)
p fib1(3)
p fib1(4)
p fib1(5)
p fib1(6)
p fib1(7)
p fib1(8)
p fib1(9)
puts
p fib2(2)
p fib2(3)
p fib2(4)
p fib2(5)
p fib2(6)
p fib2(7)
p fib2(8)
p fib2(9)
puts
p fib3(2)
p fib3(3)
p fib3(4)
p fib3(5)
p fib3(6)
p fib3(7)
p fib3(8)
p fib3(9)
