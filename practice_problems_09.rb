# Practice Problem 9
# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

# Copy Code
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! do |subarrays| 
  subarrays.sort do |a, b|
    b <=> a
  end
end