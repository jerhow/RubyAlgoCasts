# // --- Directions
# // Given an array and chunk size, divide the array into many subarrays
# // where each subarray is of length size
# // --- Examples
# // chunk([1, 2, 3, 4], 2) --> [[ 1, 2], [3, 4]]
# // chunk([1, 2, 3, 4, 5], 2) --> [[ 1, 2], [3, 4], [5]]
# // chunk([1, 2, 3, 4, 5, 6, 7, 8], 3) --> [[ 1, 2, 3], [4, 5, 6], [7, 8]]
# // chunk([1, 2, 3, 4, 5], 4) --> [[ 1, 2, 3, 4], [5]]
# // chunk([1, 2, 3, 4, 5], 10) --> [[ 1, 2, 3, 4, 5]]

# This implementation could have been a little shorter, but we're using
# some local variables ('slice_start', 'slice_length', etc) for clarity over brevity.
def chunk(arr, size)
  extras = arr.length % size
  results = []

  # Drop the remainder, and subtract one because we're iterating from zero
  iters = (arr.length / size).floor(0) - 1 # 'iterations'
  (0..iters).each do |i|
    slice_start = size * i
    slice_length = size
    results.append( arr.slice(slice_start, slice_length) )
  end

  # Determine the position (+ length) in the array in order to extract the remaining elements
  slice_start = arr.length - extras
  slice_length = arr.length - slice_start

  results.append( arr.slice(slice_start, slice_length) ) if extras > 0
  results
end

p chunk([1, 2, 3], 2)
p chunk([1, 2, 3, 4], 2)
p chunk([1, 2, 3, 4, 5], 2)
p chunk([1, 2, 3, 4, 5, 6, 7, 8], 3)
p chunk([1, 2, 3, 4, 5], 4)
p chunk([1, 2, 3, 4, 5], 10)
