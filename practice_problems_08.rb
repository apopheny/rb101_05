# Practice Problem 8
# Using the each method, write some code to output all of the vowels from the strings.

# Copy Code
# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u y)

hsh.each do |phrases| 
  phrases[1].each do |words|
    words.chars.each do |chars|
      p chars if vowels.include?(chars)
    end
  end
end 