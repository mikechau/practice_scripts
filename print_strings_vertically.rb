puts "Enter a sentence you want to display vertically:"
array = gets.chomp
puts "=" * array.length
array = array.split(/ /)
#array = ["let", "the", "bodies", "hit", "the", "floor"]

# find the largest word
largest_word_length = 0
array.each do |word|
  if word.length > largest_word_length
    largest_word_length = word.length
  end
end

#break words down into letter arrays and put them back into a new array
broken_words_array = []
array.each_with_index do |word,idx|
  broken_words = word.scan(/./)
  broken_words_array << broken_words
end

#expand the array if is not the length of the largest word
broken_words_array.each_with_index do |word,idx|
  if word.count < largest_word_length
    difference = largest_word_length - word.count
    difference.times do
      word << ' '
    end
  end
end

#collect each letter from their corresponding index and place into array
new_word_array = []
largest_word_length.times do |idx|
  new_word_array << broken_words_array.collect {|ind| ind[idx]}
end

#give the illusion of printing the words vertically by taking the array and displaying it as a string with spaces
new_word_array.each do |word|
  puts word.join(" ")
end