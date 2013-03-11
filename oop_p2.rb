# You might be wondering why we need to hide information in Ruby. Isn't it okay for every part of your Ruby program to know what every other part is doing?

# Possibly, if you're the only one writing and using your software. But when other people are working on or using your programs, they may attempt to muck around with the way different parts of your program do their jobs. You don't want that!

# For this reason, Ruby allows you to explicitly make some methods public and others private. Public methods allow for an interface with the rest of the program; they say, "Hey! Ask me if you need to know something about my class or its instances."

# Private methods, on the other hand, are for your classes to do their own work undisturbed. They don't want anyone asking them anything, so they make themselves unreachable!

# Check out the code in the editor. We've created a public about_me method and a private bank_account_number method. Click Run to see what happens when we try to call the bank_account_number method from outside the class!

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  public    # This method can be called from outside the class.

  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end

  private   # This method can't!

  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new("Eric", 26)
eric.about_me
eric.bank_account_number

# I'm Eric and I'm 26 years old!
# private method `bank_account_number' called for #<Context::Person:0x0000000

# # public
# Great work! Now we'll get into the details of public and private methods.
# Methods are public by default in Ruby, so if you don't specify public or private, your methods will be public. In this case, however, we want to make it clear to people reading our code which methods are public. We do this by putting public before our method definitions, like so:

 class ClassName
  # Some class stuff
  public
  def public_method
    # public_method stuff
  end
end

# Note that everything after the public keyword through the end of the class definition will now be public unless we say otherwise. (We'll say otherwise in the next exercise.)
# For now, let's add a public method called bark to Dog. The bark method should puts "Woof!".

class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  public
  def bark
    puts "Woof!"
  end
end

# Just as we use public to announce our public methods, we use private to specify our private ones:
class ClassName
  # Some class stuff

  public
  # Public methods go here
  def public_method; end

  private
  # Private methods go here
  def private_method; end
end

# (Note how we used our semicolon trick from last time to write our empty method definitions on one line.)
# private methods are just that: they're private to the object where they are
# defined. This means you can only call these methods from other code inside
# the object. Another way to say this is that the method cannot be called with an explicit receiver. You've been using receivers all along—these are the objects on which methods are called! Whenever you call object.method, object is the receiver of the method.
# In order to access private information, we have to create public methods that know how to get it. This separates the private implementation from the public interface, and we'll go over this in more detail in the next two exercises.
# Add a private method called id to Dog. The id method should create an @id_number instance variable and set it equal to 12345.

class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  public
  def bark
    puts "Woof!"
  end

  private
  def id
    @id_number = 12345
  end
end

# # attr
# We saw in the lesson on classes that Ruby needs methods in order to access attributes. For instance, if we want to access a @name instance variable, we had to write something like

def name
  @name
end

# Well, no longer! We can use attr_reader to access a variable and attr_writer to change it. If we write

class Person
  attr_reader :name
  attr_writer :name
  def initialize(name)
    @name = name
  end
end

# Ruby does something like this for us automatically:

def name
  @name
end

def name=(value)
  @name = value
end

# Like magic, we can read and write variables as we please! We just pass our instance variables (as symbols) to attr_reader or attr_writer.
# (That name= might look funny, but you're allowed to put an = sign in a method name. That's just a Ruby convention saying, "hey, this method sets a value!")
# We've brought back our Person class with a method for getting @name and a method for changing his or her @job. Go ahead and remove the name and job= methods and add an attr_reader for :name and an attr_writer for :job.

# You'll want to remove the name and job= methods from your class entirely, then add attr_reader for :name and attr_writer for :job at the top. For example, your attr_reader will look like this:

# class Person
#   attr_reader :name
# # All the other class stuff
# end

