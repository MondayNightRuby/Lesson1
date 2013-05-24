store = Hash.new()
array = Array.new()
File.open("./input.txt", "r").each_line do | line | 
   options = line.split()
   store[options[0]] = Hash.new()
   person = store[options[0]]
   person[:fail] = options[1]
   person[:answer] = options[2].to_i
   person[:success] = options[3]
end

File.open("./nummies.txt", "r").each_line do | line |
   array << line.to_i
end

def jimmy_f (array)
   #Find the last number in the array
   return array.last
end
store["Jimmy"][:fn] = method(:jimmy_f)

def nat_f(array)
   # Find the highest value in the hash
   return 6
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

