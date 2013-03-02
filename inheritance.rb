# Inheritance is a tricky concept, so let's go through it step by step.

# Inheritance is the process by which one class takes on the attributes and methods of another, and it's used to express an is-a relationship. For example, a cartoon fox is a cartoon mammal, so a CartoonFox class could inherit from a CartoonMammal class. However, a Wizard is not an Elf , so it shouldn't inherit from the Elf class (even if they have a lot of magical attributes and methods in common). Instead, both Wizard and Elf could ultimately inherit from the same MagicalBeing class.

# Check out the code in the editor. We've defined a class, ApplicationError, as well as a SuperBadError class that inherits from ApplicationError. Note that we don't define the display_error method in the body of SuperBadError, but it will still have access to that method via inheritance.

class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

# Error! Error!

# # inheritance
# In Ruby, inheritance works like this:

# class DerivedClass < BaseClass
#   # Some stuff!
# end

# where the derived class is the new class you're making and the base class is the class from which that new class inherits. You can read "<" as "inherits from."
# We've created an Application class in the editor to the right. Create your own class, MyApp, that inherits from Application. No need to put anything inside your class definition just yet!

class MyApp < Application
end

# # override
# Sometimes you'll want one class that inherits from another to not only take on the methods and attributes of its parent, but to override one or more of them.
# For instance, you might have an Email class that inherits from Message. Both classes might have a send method that sends them, but the e-mail version may have to identify valid e-mail addresses and use a bunch of e-mail protocols that Message knows nothing about. Rather than add a send_email method to your derived class and inherit a send method you'll never use, you can instead just explicitly create a send method in the Email class and have it do all the email-sending work.
# This new version of send will override (that is, replace) the inherited version for any object that is an instance of Email.
# Let's try a more entertaining (if less realistic) example. Create a new class, Dragon, that inherits from Creature. Give your derived class a fight method that overrides Creature's; instead of returning "Punch to the chops!", it should return "Breathes fire!".

class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!

class Dragon < Creature
  def fight
    return "Breathes fire!"
  end
end

# # super
# On the flip side, sometimes you'll be working with a derived class (or subclass) and realize that you've overwritten a method or attribute defined in that class' base class (also called a parent or superclass) that you actually need. Have no fear! You can directly access the attributes or methods of a superclass with Ruby's built-in super keyword.

# The syntax looks like this:

# class DerivedClass < Base
#   def some_method
#     super(optional args)
#       # Some stuff
#     end
#   end
# end

# When you call super from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same name as the one from which super is called. If it finds it, Ruby will use the superclass' version of the method.
# We decided we want to do some chops-punching after all! Let's do two things:
#     Add a puts "Instead of breathing fire..." as the first line in our Dragon's fight method.
#     Replace the return statement inside Dragon's definition of fight with the keyword super. (No need to pass any arguments to super, since Creature's fight method doesn't take any.)

class Dragon < Creature
  def fight
    puts "Instead of breathing fire..."
    super
  end
end

# Instead of breathing fire...
# Punch to the chops!

# # mixins
# Any given Ruby class can have only one superclass. Some languages allow a class to have more than one parent, which is a model called multiple inheritance. This can get really ugly really fast, which is why Ruby disallows it.
# However, there are instances where you want to incorporate data or behavior from several classes into a single class, and Ruby allows this through the use of mixins. We'll learn about mixins in a later lesson! For now, we'll demonstrate what happens if you try to do multiple inheritance in Ruby.
# The demo code we're about to show you includes a fancy trick: if you want to end a Ruby statement without going to a new line, you can just type a semicolon. This means you can write something like

# class Monkey
# end

# on just one line: class Monkey; end. This is a time saver when you're writing something very short, like an empty class or method definition.
# Check out the code in the editor. See how we're trying to get Dragon to inherit from Creature and Person? We'll get a superclass mismatch for class Dragon error if we try this

class Creature
  def initialize(name)
    @name = name
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Dragon < Creature; end
class Dragon < Person; end

# superclass mismatch for class Dragon

##### REVIEW

# Create a class called Message and give it an initialize method. The initialize method should take two parameters, from and to, and set them to the instance variables @from and @to (respectively). Don't worry about creating an instance of your class just yet.

# class ClassName
#   def initialize(param1, param2)
#     @param1 = param1
#     @param2 = param2
#   end
# end

class Message
  def initialize(from, to)
    @from = from
    @to = to
  end
end

# Perfect! Now let's class things up a bit with a class variable.
# Give your Message class a @@messages_sent class variable and set it equal to 0. In the body of your initialize method, increment this value by 1 so that each time a new Message object is created, @@messages_sent will go up by 1.

class Message
  @@messages_sent = 0
  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

# Perfect! Let's go ahead and create an instance of our Message class.
# Create a variable called my_message that's an instance of your Message class. Give it whatever from and to arguments you want!
my_message = Message.new("Mike", "John")

# Create a second class, Email, that inherits from Message. Give it its own initialize method that takes just one parameter, subject, and has one instance variable, @subject, set equal to subject.
# This should look very similar to the code you've already written. Patterns, patterns everywhere!

# Inheritance looks like this in Ruby:

# DerivedClass < BaseClass
#   # Some class stuff
# end

# Your initialize method for Email should look like this:

# def initialize(subject)
#   @subject = subject
# end

class Email < Message
  def initialize(subject)
    @subject = subject
  end
end


# You're a champion! Our last topic of the morning / afternoon / evening: Ruby's super keyword. (We've decided we liked Message's initialize method after all.)
# To finish this lesson, go ahead and remove the subject parameter and @subject instance variable from Email.
# Pass Email's initialize method the same two parameters passed to Message's—from and to—and add the super keyword as the only line of code in the body of Email's initialize method.

# The Email class should contain a single method, initialize, which now takes two variables: from and to. The only line of code in the body of initialize should be a single word: super!

class Email < Message
  def initialize(from, to)
    super
  end
end