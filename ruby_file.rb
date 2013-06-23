# This is a ruby script.  When you run the program "ruby", and specify
# this file, ruby will interpret everything and do what the script says.
# All scripts are run one line at a time, top to bottom.  There's no magic.


#This line says let "store" be a new variable, and let it hold a
#new Hash object.  A hash object is something that maps values to other objects,
#for example, a dictionary maps words to their definitions.  So,
#for example, if we had a "favorite_teams" hash,
#the value for jimmy might be like this: favorite_teams["Jimmy"] = "Miami Heat".
#Nat would be like favorite_teams["Nat"] = "Purple Cats"
#"store" and "favorite_teams" can be almost any word.  There are a 
#few special ones like hash, new, Array, or do.
#Our "store" hash starts as empty.
store = Hash.new()

#This line opens the "./input.txt".  The "./" specifies the directory we're
#already in, and input.txt is the name.  So it will open input.txt from our
#Lesson1 directory.  The "r" specifies we want to read from the file, as
#opposed to writing to it.  
input_file = File.open("./input.txt", "r")

#Once we've opened the file - File.open() - we want #to do something to each line in the file,
#so we call "each_line" on the file. each_line needs to know the code we want
#to use on each_line.  That's specified by the "do".  The "line" between the
#Pipes - | line | - specifies the variable that we will put each line of the
#file into. For each_line, we'll do something on it until the "end" statement,
#then we'll take the next line and do stuff on it.
input_file.each_line do | line | 

   #Now that we have a line in the file, the first
   #thing we want to do is create a variable called array_of_line_pieces.
   #We want to store the results of calling "split" on our line
   #in the array_of_line_pieces variable.  "Split" will split the text in the line
   #into individual pieces depending on the character you pass into
   #the function.  If you open the input file, you'll see each line
   #looks like "Word;sentence;Number;sentence". Split will return an
   #array, with each piece in its own slot in the array. So,
   #array_of_line_pieces[0] will be
   #the first piece of the first line in the file -- in our case, "Jimmy"
   #array_of_line_pieces[1] will be the second piece of the first line,
   #so "James is bad"
   array_of_line_pieces = line.split(';')

   #This line says to save another new Hash.  We want to save this 
   #new hash as the value for one of the spots in our first hash. We want
   #that spot to be whatever is in array_of_line_pieces[0].  From above, we know
   #that array_of_line_pieces[0] holds Jimmy.  So, store["Jimmy"] will hold
   # a new hash.
   store[ array_of_line_pieces[0] ] = Hash.new()

   #In the person variable, we get exactly what we just
   #saved above, so a new Hash, in the first run through, 
   #its the "Jimmy" hash
   person_hash = store[array_of_line_pieces[0]]

   #In the person_hash, in the ":fail" slot, put array_of_line_pieces[1], which
   #from above we know to be "James is bad".  
   person_hash[:fail] = array_of_line_pieces[1]

   #In the person_hash ":answer" slot, put array_of_line_pieces[2].
   #In the input file, the 3rd piece is a number.  So instead of saving
   #a text string, save the number.  Thus we call "to_i" on our text string,
   #which converts the string "to integer".
   person_hash[:answer] = array_of_line_pieces[2].to_i

   #Next, we store the last piece of the line in the person_hash[:success]
   #slot.  The last piece of the line is text again, so no need to call to_i
   person_hash[:success] = array_of_line_pieces[3]

#This line indicates the end of the code block.  Because each_line does
   #something on each line, when it reaches this point, it will go back to the
   #start of the code block and do it all over again with the next line.  As
   #a results, the previous lines of code will all get run with "line" being
   #each different line in the file.
end

#This line says lets create a variable called "input_numbers" and 
#store a new Array in it.  An array is just a group of numbers, with each
#number in a specific slot in the array.  For example if input_numbers
#had two numbers in it, input_numbers[0] might
#equal 100 and input_numbers[1] might equal 24.  As you add numbers, more slots
#get added to the array.  Our array starts empty
input_numbers = Array.new()

#This line opens a different file, calls each_line on it right away.
File.open("./nummies.txt", "r").each_line do | line |
   #for each line, we convert the line to an integer (to_i) and add it to the
   #back of our empty array by using the "<<" operator
   input_numbers << line.to_i
end

#This line defines something.  It defines a function, called 
#jimmy_f.  jimmy_f takes in a variable, which it calls some_array.
#The code inside the definition doesn't get run until someone calls
#the jimmy_f function.  We'll do that below.
def jimmy_f (some_array)

   #The only thing the jimmy_f function does is return the last number in the
   #input_numbers array
   return some_array.last
end
store["Jimmy"][:fn] = method(:jimmy_f)

def nat_f(array)
   # Find the highest value in the hash
end
store["Nat"][:fn] = method(:nat_f)

def nick_f(array) 
   # Find the lowest value in the hash
end
store["Nick"][:fn] = method(:nick_f)

def foreman_f(array) 
   # Find the sum of all the items in the hash
end
store["Foreman"][:fn] = method(:foreman_f)

def dihno_f(array)
   #find the product of all the items in the hash
end
store["Dihno"][:fn] = method(:dihno_f)


store.each do | key, person_hash |
   if person_hash[:answer] == person_hash[:fn].call(array)
      puts person_hash[:success]
   else
      puts person_hash[:fail]
   end
end

