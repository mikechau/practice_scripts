#classes

# Ruby is an object-oriented programming language, which means it manipulates programming constructs called objects. (Almost) everything in Ruby is an object! You've been using them all along, so they should be very familiar. Objects have methods, which you've seen before, and attributes, which are just data. For instance, in

# "Matz".length
# # ==> 4

# the "Matz" object is a string with a .length method and a length attribute of 4. We'll learn how to build our own objects with their own methods and internal variables in the next few exercises.
# But what exactly makes "Matz" a string? The fact that it's an instance of the String class. A class is just a way of organizing and producing objects with similar attributes and methods.
# Check out the code in the editor to the right. We've defined our own class, Language, and created ruby, python, and javascript instances. Click Run to see how they work!

class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

# # instance variables
# # In Ruby, we use @ before a variable to signify that it's an instance variable. This means that the variable is attached to the instance of the class. For example,

# class Car
#   def initialize(make, model)
#     @make = make
#     @model = model
#   end
# end

# kitt = Car.new("Pontiac", "Trans Am")

# creates an instance, kitt, of the class Car. kitt has his own @make ("Pontiac") and @model ("Trans Am"). Those variables belong to the kitt instance, which is why they're called instance variables.

class Person
  def initialize(name)
    @name = name
  end
end

# We can create an instance of a class just by calling .new on the class name, like so:
# me = Person.new("Eric")
# Create a variable, matz, and set it equal to calling .new on your Person class. Pass .new the name "Yukihiro" as its only argument.

matz = Person.new("Yukihiro")

