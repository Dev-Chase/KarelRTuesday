notes = Array.new(200) { rand(1..100) }

# Debugging
# puts(notes.to_s())

# Getting Input
print("Saisir une valeur entre 1-100: ")
STDOUT.flush()
input = gets().chomp().to_i()

# Processing Input
superieures = notes.select {|x| x > input}
inferieures = notes.select {|x| x < input}
egales = notes.select {|x| x == input}

# Printing Results
puts(superieures.length.to_s() + " valeurs sont supérieures à " + input.to_s())
puts(inferieures.length.to_s() + " valeurs sont inférieures à " + input.to_s())
puts(egales.length.to_s() + " valeurs sont égales à " + input.to_s())

