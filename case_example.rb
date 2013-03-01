# case statement

var = "hello"

case var
when "hello"
  puts "var is hello!"
when "hi"
  puts "var is hi!"
when "yo"
  puts "var is yo!"
else
  puts "I dunno..."
end

# case statement, shorter

case var
  when "hello" then puts "var is hello!"
  when "hi" then puts "var is hi!"
  when "yo" then puts "var is yo!"
  else puts "I don't know!"
end
