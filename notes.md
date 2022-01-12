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

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

The `Array#map` method is called on two-dimensional array `[[1, 2], [3, 4]]`, with the elements `[1, 2]` and `[3, 4]` being passed into the method as local variable `arr`. The `Array#map` method is called once again on these elements, with the Integer elements `1, 2, 3,` and `4` being passed in seperately. Each of these integers are assigned to the local variable `num` and the `BigDecimal#*` called to multiply `num` by Integer `2`. The return value for each iteration will be returned to the inner `map` method, returning new arrays `[2, 4]` and `[6, 8]`, which will then be returned to the outer `map` method as a new array `[[2, 4], [6, 8]]`, which will be the final return value with the original array not mutated and no ouptut.

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

A one-dimensional Array object with the elements `{ a: 'ant', b: 'elephant' }, { c: 'cat' }` has the  `Array#select` method called upon it. Each element is assigned to the local variable `hash`, and then the `Enumerable#all?` method is called upon these elements to evaluate a block. Within the block the elements of the hashes are assigned to the local variables `key` for the keys, and `value` for the values. The values have the `String#[]` method called upon them, evaluating the first index position of the string objects referenced by `value` -- `'a'`, `'e'`, and `'c'`, respectively --  against the value of their keys (referenced by `key`) which have the `Symbol#.to_s` methods called upon them, evaluating to `'a'`, `'b'`, and `'c'`, respectively. The method evaluating them is the `Comparitor#==` method, yieliding the Boolean objects `true`, `false`, and `true`.

The `all?` method then returns the hashes for which all elements have evaluated to `true`. Given that the first hash, `{ a: 'ant', b: 'elephant' }` has only one key-value pair that evaluates to `true`, only `{ c: 'cat' }` is returned by the `all` method, as its singular key-value pair evaluates to `true`.

The select method then returns a new array of all elements that have evaluated as `true` within the block, which is `[{ c: 'cat' }]`.

### What would happen if, instead of using all?, we used any?. Why would this affect the return value of select?

This would return a new array `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`

## This example contains a triple-level nested array. Take your time and try to break down each component. Hint: the top-level array is a 2-element array.
```ruby
[ [[1], [2], [3], [4]], [['a'], ['b'], ['c']] ].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```
The `map` method is called on three-dimensional array `[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]`, with the elements `[[1], [2], [3], [4]]` and `[['a'], ['b'], ['c']]` assigned to variable `element1` for iteration.

* On the first iteration of the `map` method, `element1` has the `each` method called upon it with the elements `[1]`, `[2]`, `[3]`, and `[4]` being assigned to local variable `element2` for iteration with the `Enumerable#partition` method called upon it.

  - On the first iteration of the `partition` block, local variable `element3` is assigned Integer `1`, and has the `Integer#size` method called upon it, calling the return value Integer `8` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - On the second iteration of the `partition` block, local variable `element3` is assigned Integer `2`, and has the `Integer#size` method called upon it, calling the return value Integer `8` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - On the third iteration of the `partition` block, local variable `element3` is assigned Integer `3`, and has the `Integer#size` method called upon it, calling the return value Integer `8` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - On the fourth iteration of the `partition` block, local variable `element3` is assigned Integer `4`, and has the `Integer#size` method called upon it, calling the return value Integer `8` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - The `partition` method returns a new array with the elements which evaluated to `true` in a subarray at index `0` and the elements which evaluated to `false` in a second subarray. As all elements returned true, they will be in the first subarray and the return value of the `partition` method for this iteration will be `[[[1], [2], [3], [4]], []]`

* On the second iteration of the `map` method, `element1` has the `each` method called upon it with the elements `['a']`, `['b']`, `['c']`, and `['d']` being assigned to local variable `element2` for iteration with the `Enumerable#partition` method called upon it.

  - On the first iteration of the `partition` block, local variable `element3` is assigned String `'a'`, and has the `String#size` method called upon it, calling the return value Integer `1` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - On the second iteration of the `partition` block, local variable `element3` is assigned String `'b'`, and has the `String#size` method called upon it, calling the return value Integer `1` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - On the third iteration of the `partition` block, local variable `element3` is assigned String `'c'`, and has the `String#size` method called upon it, calling the return value Integer `1` against the Integer `0` using the `Comparitor#>` method. This evaluates to Boolean `true`.
  - The `partition` method returns a new array with the elements which evaluated to `true` in a subarray at index `0` and the elements which evaluated to `false` in a second subarray. As all elements returned true, they will be in the first subarray and the return value of the `partition` method for this iteration will be `[[['a'], ['b'], ['c']], []]`

* The `each` method returns the calling array, [[1], [2], [3], [4]] for the first iteration and [['a'], ['b'], ['c']] for the second iteration.

The `map` method returns a new array that is the return value of its block, which will be the callers of the `each` method, [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].

## Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```
This will return a new array `[[[2, 3], [4, 5]], [6, 7]]`

The two-dimensional array `[[[1, 2], [3, 4]], [5, 6]]` has the `Array#map` method called upon it, with the elements `[[1, 2], [3, 4]]` and `[6, 7]` assigned to local variable `arr` per iteration.

* On the first iteration, the `Array#map` method is called on `[[1, 2], [3, 4]]`, with the elements `[1, 2]` and `[3, 4]` assigned to local variable `el` per iteration
  - On the first iteration the `Object#if` method is called on `el` with the value `[1, 2]`.
    + The `if` method calls the `Object#to_s` (returning `'[1, 2]'`) and `Integer#size` (returning Integer `6`) method on the value `[1, 2]`, then using `Comparitor#==` to compare Integer `6` and Integer `1`, returning Boolean `false`
    + The `if` method then calls the `Array#map` method on el referencing the value `[1, 2]`, assigning the elements to local variable `n`
      * The `map` method then adds the integers referenced by `n` to Integer `1`, returning a new array `[2, 3]`
  - On the second iteration the `Object#if` method is called on `el` with the value `[3, 4]`.
    + The `if` method calls the `Object#to_s` (returning `'[3, 4]'`) and `Integer#size` (returning Integer `6`) method on the value `[3, 4]`, then using `Comparitor#==` to compare Integer `6` and Integer `1`, returning Boolean `false`
    + The `if` method then calls the `Array#map` method on el referencing the value `[3, 4]`, assigning the elements to local variable `n`
      * The `map` method then adds the integers referenced by `n` to Integer `1`, returning a new array `[4, 5]`
  - On the third iteration the `Object#if` method is called on `el` with the value Integer `5`.
    + The `if` method calls the `Object#to_s` (returning `5'`) and `Integer#size` (returning Integer `1`) method on the value `5`, then using `Comparitor#==` to compare Integer `1` and Integer `1`, returning Boolean `true`
      * The `if` method then adds the Integer referenced by el, `5` and Integer `1`, returning Integer `6`
  - On the fourth iteration the `Object#if` method is called on `el` with the value Integer `6`.
    + The `if` method calls the `Object#to_s` (returning `6'`) and `Integer#size` (returning Integer `1`) method on the value `6`, then using `Comparitor#==` to compare Integer `1` and Integer `1`, returning Boolean `true`
      * The `if` method then adds the Integer referenced by el, `6` and Integer `1`, returning Integer `7`
  - The map method returns a new array `[[2, 3], [4, 5]]`
  - The map method returns a new array `[6, 7]`
* The map method returns a new array `[[[2, 3], [4, 5]], [6, 7]]`
