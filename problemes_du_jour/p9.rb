# Information
puts("--------------------")
puts("Problème #9 - Fahrenheit à Celsius")
puts("Saisir \"break\" ou \"exit\" afin d'Arrêter le Programme")

loop do
  # Obtenir Valeur de l'Utilisateur
  print("Température Celsius: ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break" || input == "exit"

  # Compléter le Problème
  celsius = input.to_f()
  puts(celsius.to_s() + " est " + ((celsius * (9.0 / 5.0)) + 32.0).to_s() + " fahrenheit")
  
  # Mettre un Sepérateur
  puts("--------------------")
end
