# Getting Input
puts("Saisir 5 Nombres, je vais les trier !")
list = 5.times.map do 
  print(": ")
  STDOUT.flush()
  gets().chomp().to_i()
end

# Printing Result
puts("Voici les nombres trier :\n#{list.sort()}")

# Old Printing (in case string formatting doesn't work)
# puts("Voici les nombres trier : ")
# puts(list.sort())
