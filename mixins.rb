## mixins

# What we did in the last exercise might not have seemed strange to you, but think about it: we mixed together the behaviors of a class and a module!
# When a module is used to mix additional behavior and information into a class, it's called a mixin. Mixins allow us to customize a class without having to rewrite code!
# Check out the code in the editor. See how we define the jump method in the Action module, then mix it into the Rabbit and Cricket classes? Click Run to see the effect!

module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump

# I jumped forward 2 feet!
# I jumped forward 3 feet!


# multiple inheritance
# Now you understand why we said mixins could give us the ability to mimic inheriting from more than one class: by mixing in traits from various modules as needed, we can add any combination of behaviors to our classes we like!
# Create a module, MartialArts, and put in a single instance method, swordsman, that just puts "I'm a swordsman." Use include to mix this into both the Ninja and Samurai classes, thereby giving them the swordsman method.

# Create your module here!
module MartialArts
  def swordsman
    puts "I'm a swordsman."
  end
end

class Ninja
  include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
  include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end

## include vs extend
# Whereas include mixes a module's methods in at the instance level (allowing instances of a particular class to use the methods), the extend keyword mixes a module's methods at the class level. This means that class itself can use the methods, as opposed to instances of the class.
# Check out the code in the editor. We've extended TheHereAnd with ThePresent, allowing it to use the now method. Click Run to see the effect!

# ThePresent has a .now method that we'll extend to TheHereAnd

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

# It's 4:0 AM (GMT).
