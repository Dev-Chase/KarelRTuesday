# Information
puts("--------------------")
puts("Problème #_ - Description")
puts("Saisir \"break\" ou \"exit\" afin d'Arrêter le Programme")

loop do

  # Obtenir Valeur de l'Utilisateur
  print(": ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break" || input == "exit"

  # Informations du Problème

  # Traiter la Valeur Saisie
  val = input

  # Compléter le Problème
  
  # Mettre un Sepérateur
  puts("--------------------")
end
