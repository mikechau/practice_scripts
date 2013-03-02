# http://stackoverflow.com/questions/5347949/whats-different-between-each-and-collect-method-in-ruby

#Array#each just takes each element and puts it into the block, then returns the original array. 

#Array#collect takes each element and puts it into a new array that gets returned:

[1, 2, 3].each { |x| x + 1 }    #=> [1, 2, 3]
[1, 2, 3].collect { |x| x + 1 } #=> [2, 3, 4]

