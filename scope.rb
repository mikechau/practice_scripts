# scope
# Another important aspect of Ruby classes is scope. The scope of a variable is the context in which it's visible to the program.
# It may surprise you to learn that not all variables are accessible to all parts of a Ruby program at all times. When dealing with classes, you can have variables that are available everywhere (global variables), ones that are only available certain methods (local variables), others that are members of a certain class (class variables), and variables that are only available to particular instances of a class (instance variables).
# The same goes for methods: some are available everywhere, some are only available to members of a certain class, and still others are only available to particular instance objects.
# Check out the code in the editor. See how some variables start with $, @, or @@? This helps mark them as global, instance, and class variables (respectively).

class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}

  def initialize(username, password)
    @username = username
    @password = password
  end

  def current_user
    @username
  end

  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.


# # variables
# Recall that instance variables begin with an @. This isn't just a Ruby convention—it's part of the syntax! Always start your instance variables with @.
# Class variables are like instance variables, but instead of belonging to an instance of a class, they belong to the class itself. Class variables always start with two @s, like so: @@files.
# Global variables can be declared in two ways. The first is one that's already familiar to you: you just define the variable outside of any method or class, and voilà! It's global. If you want to make a variable global from inside a method or class, just start it with a $, like so: $matz.
# We'll go through instance and class variables in more detail in a moment. First, let's do a quick review of local and global scope.
# Take a look at the code to the right. The variable my_variable is inside a class, so it's not reachable by the puts method outside it. But you can fix this! Use either of the two global variable tricks mentioned above.

# You can do one of two things:

#     Move my_variable out of the class and into the global scope, or
#     Put a $ on the front of my_variable to make it global from inside the class.

# option 2:
class MyClass
  $my_variable = "Hello!"
end

puts $my_variable

# # instances
# Good! A caveat, though: global variables can be changed from anywhere in your program, and they are generally not a very good idea. It's much better to create variables with limited scope that can only be changed from a few places!
# For example, instance variables belong to a particular object (or "instance"). Let's get in some practice with instance variables! We've added our Person class from before to the editor.
# Go ahead and add age and profession parameters to the initialize method, then set these equal to instance variables in the body of the method. Use the name/@name example as a guide.

class Person
  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
  end
end

# # class variables
# We can create class variables by starting a variable name with two @ symbols. Class variables are attached to entire classes, not just instances of classes, like so:

# class MyClass
#   @@class_variable
# end

# Because there's only one copy of a class variable shared by all instances of a class, we can use them to pull off some cool Ruby tricks. For example, we can use a class variable to keep track of the number of instances of that class we've created. Let's do that now!

# Let's do three things:
#     Create a class variable, @@people_count, on line 3, and set it equal to 0.
#     Increment @@people_count on line 8.
#     Return @@people_count on line 13 so that our puts on line 20 will print out the number of people created so far.

class Person
  # Set your class variable to 0 on line 3
  @@people_count = 0

  def initialize(name)
    @name = name
    # Increment your class variable on line 8
    @@people_count += 1
  end

  def self.number_of_instances
    # Return your class variable on line 13
    @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"

# Number of Person instances: 2



