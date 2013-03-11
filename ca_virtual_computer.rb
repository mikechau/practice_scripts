# Now that you've learned all about classes and objects in Ruby, you can create any kind of Ruby object your heart desires. In this project, we'll use our newfound knowledge to create a class, Computer, and generate instances of that class that can manipulate imaginary files for us.

class Machine
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end

  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"



# All right! Let's go ahead and set up our class.
# Create a class called Computer and give it an initialize method that takes no parameters. The body of initialize should be empty.

class Computer
  def initialize
  end
end


# Well done! Now let's spice up our initialize method by passing it some parameters and setting some instance variables.
# Update initialize to take two parameters, username and password. In the body of initialize, set the instance variables @username and @password (respectively) to these parameters.
# In your initialize method, you'll also want to create a @files instance variable and set this to an empty hash. This is so we can keep track of our files later!

class Computer
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
  end
end


# Let's go ahead and toss in a class variable. We'll use the variable @@users to keep track of all the users on our computer.
# Add a class variable called @@users to your Computer class. Set it equal to an empty hash.
# In your initialize method, set @@users[username] = password so that your @@users hash keeps usernames as keys with each username's password as the associated value.

class Computer

  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

end

# Excellent! Our class is coming together, but it's a bit boring. Let's add another method, create. We'll want to do a few things in it:
    # It should take a single parameter, filename.
    # Inside create, declare a variable called time and set it equal to the current time. We can do this by setting time equal to Time.now (Ruby's built-in magic to the rescue)!
    # Let's add the filename passed in to create to the @files hash: filename should be the key, and time should be the value.
    # puts a message telling the user that a new file was created. Feel free to put in any information you like; the one we used in exercise 1 printed the filename, the username, and the time.

class Computer

  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} created by #{@username} at #{time}"
  end
end


# Perfect! Now that we think of it, though, we could have a whole bunch of users creating files every which where, and we don't have a way of getting to our @@users class variable! We'll need to create a method to reach it.
# Because @@users is a class variable, we'll use a class method to grab it. Most of the methods you've seen so far are instance methods—they work on a particular instance/object, such as "matz" or "blixy". A class method belongs to the class itself, and for that reason it's prefixed with the class name, like so:

# class Machine
  # def Machine.hello
    # puts "Hello from the machine!"
  # end
# end

# (There's a shortcut for this, which we'll learn in a later lesson.)
# Add a new class method to your Computer class called get_users. It should return the @@users class variable.

# Your code should look something like this:

# def ClassName.method_name
  # @@class_variable
# end

# Where ClassName is Computer, method_name is get_users, and @@class_variable is @@users.

class Computer

  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} created by #{@username} at #{time}"
  end

  def Computer.get_users
    @@users
  end
end

# Excellent! Last step: let's create an instance of our Computer class.
# Create a variable called my_computer and set it equal to an instance of your Computer class. Feel free to give it whatever username or password you like!

# Remember, we instantiate a class like so:
# my_instance = ClassName.new(arguments)

my_computer = Computer.new("Mike", "password")

