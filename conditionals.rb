# conditions

# one line if/unless
puts "hello world" if false
puts "hello world" if true

puts "hello world" unless false # equiv to if true
puts "hello world" unless true # equiv to if false

# ternary conditional expression
# boolean ? Do this if true: Do this if false

puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."
puts 10 > 11 ? "10 is not less than 11 is true!" : "10 is not 11 is false!"

# each loop with one line conditionals
# print only even numbers
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array.each { |num| puts num if num % 2 == 0 }
my_array.each { |num| puts num if num.even? }
