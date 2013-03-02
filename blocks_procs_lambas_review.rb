# Review for blocks, procs, and lambas

# block
# You're basically a Ruby block master at this point. This should be pretty easy!
# The odds_n_ends array is full of all sorts of objects, but we only want the integers (numbers without decimal bits). Create a new array, ints, with a combination of the .select method and a block.
# You can use the .is_a? method to check if an array element is an Integer.

odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]

ints = odds_n_ends.select { |element| element.is_a? Integer }
# ==> [42, 3, 19]

#proc
# Create a proc called under_100 that checks if a number it's passed is less than 100. (We'll handle passing this proc the .select method in the next exercise—we won't need to do anything with the ages array just yet.)

ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

# Add your code below!

under_100 = Proc.new { |num| num < 100 }

# pass proc to method
# Now we'll be using the ages array. Create a variable called youngsters and set it equal to calling .select on ages, and pass in your under_100 proc to filter for the ages that are less than one hundred. Remember to pass &under_100 to convert your proc to a block!

youngsters = ages.select(&under_100)
# ==> [23, 7, 11, 94, 70, 44]

#lambdas
# Second verse: same as the first! Let's go ahead and make ourselves a lambda.
# Create a lambda called first_half that checks if a hash value is less than (that is, earlier in the alphabet than) "M". (No need to do anything with the crew hash yet.) Make sure to use a capital "M," since we'll be checking capitalized names!
# Because it will be checking a hash, your lambda should include |key, value| instead of just |value|.

crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
# Add your code below!

first_half = lambda { |rank, name| name < "M" }

# #lambda to method
# Home stretch! Now let's pass our lambda to a method, as well.
# To finish up, let's go ahead and create a variable called a_to_m and set it equal to calling .select on crew, and pass in your first_half lambda to filter for the names that are before "M" in the alphabet. Remember to pass &first_half to convert your lambda to a block!

a_to_m = crew.select(&first_half)
# ==> {:lt_cdr=>"Data", :chief_engineer=>"LaForge", :doctor=>"Crusher"}
