# # public methods
# All right! Let's do a little practice with public methods.
# We've set up an Application class in the editor. Add a public method called print_status to Application that puts "All systems go!". Don't forget to use the public keyword!

# class ClassName
#   public
#   def public_method
#   end
# end

class Application
  attr_accessor :status
  def initialize; end
  # Add your method here!
  public
  def print_status
    puts "All systems go!"
  end
end

# # private
# Good! Now let's try a private method.
# Below your public method, add a private method called password that returns the super secret password 12345.

# class ClassName
  # private
  # def private_method
  # end
# end

class Application
  attr_accessor :status
  def initialize; end
  # Add your method here!
  private
  def password
    return 12345
  end
  public
  def print_status
    puts "All systems go!"
  end
end

# # module
# Super. Let's move on to modules!
# Create your own module called Languages in the editor to the right. Include a constant called FAVE and set it equal to a string naming your favorite programming language!

# module ModuleName
# end

# Create your module below!
module Languages
  FAVE = "Ruby"
end

# # mixin
# Almost there! Our review wouldn't be complete without a little mixin magic.
# Finally, let's include our Languages module in the Master class (on line 6) so that our favorite language gets printed to the console.

# class ClassName
  # include ModuleName
# end

module Languages
  FAVE = "Ruby"  # This is what you typed before, right? :D
end

class Master
  include Languages
  def initialize; end
  def victory
    puts FAVE
  end
end

total = Master.new
total.victory



