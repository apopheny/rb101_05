```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
 end

 \# 1
 \# 3
 \# => [[1, 2], [3, 4]]
```

We call the `Array#each` method on the two dimensional array `[[1, 2], [3, 4]]`. The `each` method will be passed the sub-arrays at index `0` and `1`, which will be assigned to the method-scope variable `arr` in that sequence as the `Array#each` method iterates through the primary array. It will use the values assigned to `arr` as an argument when evaluating the `do...end` block. 

The block calls the `Kernel#puts` method on the evaluation of the `Array#first` method on the value assigned to `arr`. In the first iteration, `Array#first` method returns the `0` index of the first subarray, `1`, which is output to the string by the `Kernel#puts` method, and returns `nil`. Similarly, the second iteration yields `3` and returns nil.

Upon completion, the `Array#each` method then returns the calling array, `[[1, 2], [3, 4]]`.

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

We call the `Array#map` method on the two-dimensional array `[[1, 2], [3, 4]]`. The method takes each sub array as an argument and assigns it to the method-scope local variable `arr`. Within the method block, the `Kernel#puts` method is called upon the return value of the `Array#first` method upon the local value `arr`. This outputs a string representation of the integer at index 0 of each subarray, `0` and `1`, respectively, and returns `nil`. 

The `Array#map` method then returns a new array that is the return value of the block upon each element of the calling array, `[nil, nil]`.

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
We call the `Array#map` method on the two-dimensional array `[[1, 2], [3, 4]]`. The method takes each sub array as an argument and assigns it to the method-scope local variable `arr`. Within the method block, the `Kernel#puts` method is called upon the return value of the `Array#first` method upon the local value `arr`. This outputs a string representation of the integer at index 0 of each subarray, `0` and `1`, respectively, and returns `nil`. The block then calls the return value of the `Array#first` method on the value assigned to `arr`, returning `1` and `3`, respectively.

The `Array#map` method then returns a new array that is assigned the return value of the block upon each element of the calling array, `[1, 3]`.

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
Local variable `my_arr` is assigned the return value of the `Array#each` method upon the two dimensional array `[[18, 7], [3, 12]]`. Each sub-array is passed as an argument to the method and assigned to local variable `arr` and used in evaluation of a block.

The block evaluates each element of each sub-array, assigning it to local variable `num` in another block. This block calls the `Object#if` method on the values assigned to num, using `Comparable#>` on the values assigned to num against Integer `5`. If the evaluation of this method returns `true`, it will then call the `String#puts` method on the value assigned to num, outputting a string representation of the integer and returning `nil`. 

This will output `18`, returning `nil` and `7`, returning `nil` for the first values assigned to `arr`. The `each` method will then return the calling object, `[18, 7]`. `arr` will then be assigned `[3, 12]`, which will output `12`, returning `nil`, at which point the `each` method will return the caller, `[3, 12]`. The each method will then return the caller `[[18, 7], [3, 12]]`. This return value will then be assigned to local variable `my_arr`.

