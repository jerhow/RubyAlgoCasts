# // --- Directions
# // Write a program that console logs the numbers
# // from 1 to n. But for multiples of three print
# // “fizz” instead of the number and for the multiples
# // of five print “buzz”. For numbers which are multiples
# // of both three and five print “fizzbuzz”.
# // --- Example
# //   fizzBuzz(5);
# //   1
# //   2
# //   fizz
# //   4
# //   buzz

def fizzbuzz(n)
  (1..n).each do |i|
    if i % 3 == 0 && i % 5 == 0
      puts "fizzbuzz"
    elsif i % 3 == 0
      puts "fizz"
    elsif i % 5 == 0
      puts "buzz"
    else
      puts "#{i}"
    end
  end
end

fizzbuzz(100)
