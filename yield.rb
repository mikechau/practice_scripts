#Why do some methods accept a block and others don't? It's because methods that accept blocks have a way of transferring control from the calling method to the block and back again. We can build this into the methods we define by using the yield keyword.

#Check out the code in the editor. We've set up a series of puts statements so you can see when we're in the block_test method and when we're in the block passed to it. Click Run to see the result!

def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

#We're in the method!
#Yielding to the block...
#>>> We're in the block!
#We're back in the method!

# when calling block_test, the yield acts as a marker to start the block


# yield with parameters
#You can also pass parameters to yield! Check out the example in the editor. See how the yield statement passes the name into the block?

#Call yield_name with your name as a parameter. Make sure to pass in a block that puts "My name is #{your name here}!"

def yield_name(name)
  puts "In the method! Let's yield."
  yield name
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |name| puts "My name is #{name}." }

# Now call the method with your name!
yield_name("Mike") { |name| puts "My name is #{name}." }

#In the method! Let's yield.
#My name is Mike.
#Block complete! Back in the method.


#Define your own method, double, that accepts a single parameter and yields to a block. Then call it with a block that multiplies the number parameter by 2. You can double any number you like!

def double(n)
  puts "So lets go with... #{n}"
  yield n
end

double(5) { |n| puts n * 2 }

#So lets go with... 5
#10
