# Practice Problem 10

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hash|
 hash.dup.each do |key, value|
  hash[key] = value + 1
 end
end

p arr2
p arr
