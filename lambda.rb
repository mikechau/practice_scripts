#lambdas

# Like procs, lambdas are objects. The similarities don't stop there: with the exception of a bit of syntax and a few behavioral quirks, lambdas are identical to procs.

# Check out the code in the editor. See the lambda bit? Typing

# lambda { puts "Hello!" }

# Is just about the same as

# Proc.new { puts "Hello!" }

# In the example to the right, when we pass the lambda to lambda_demo, the method calls the lambda and executes its code.

def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })

# I'm the method!
# I'm the lambda!

# Lambdas are defined using the following syntax:
# lambda { block }

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
# Write your code below this line!

symbolize = lambda { |string| string.intern }

# Write your code above this line!
symbols = strings.collect(&symbolize)

# ==> [:leonardo, :donatello, :raphael, :michaelangelo]

# Lambas vs procs
# If you're thinking that procs and lambdas look super similar, that's because they are! There are only two main differences.

# First, a lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

# Second, when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.

# To see how this works, take a look at the code in the editor. Our first method calls a proc; the second calls a lambda.

# Click Run to see the return values. See how the proc says Batman will win? This is because it returns immediately, without going back to the batman_ironman_proc method.

# Our lambda, however, goes back into the method after being called, so the method returns the last code it evaluates: "Iron Man will win!"

def batman_ironman_proc
  victor = Proc.new { return "Batman will win" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end


# Great work! You've written your own lambda and seen how to pass it to a method. Now it's time for you to write a lambda and pass it to a method!

# If you think this will be a lot like what you've already done with procs, you're exactly right. Just like with procs, we'll need to put & at the beginning of our lambda name when we pass it to the method, since this will convert the lambda into the block the method expects.

# That symbolize lambda was pretty cool. Let's riff on it with a lambda that checks to see if each element in an array is a symbol. We can do this checking with the .is_a? method, which returns true if an object is the type of object named and false otherwise:

# :hello.is_a? Symbol
# # ==> true

# The word Symbol has to be capitalized when you're doing an .is_a? check!

#     Create a lambda, symbol_filter, that checks to see if each element in my_array is a symbol.
#     Create a variable, symbols, and set this equal to calling .select on my_array and passing it your lambda.

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

# Add your code below!

symbol_filter = lambda { |element| element.is_a? Symbol }

symbols = my_array.select(&symbol_filter)

# ==> [:kettles, :mittens, :packages]

## REVIEW
#     A block is just a bit of code between do..end or {}. It's not an object on its own, but it can be passed to methods like .each or .select.
#     A proc is a saved block we can use over and over.
#     A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.

# There are obviously lots of cases in which blocks, procs, and lambdas can do similar work, but the exact circumstances of your program will help you decide which one you want to use.