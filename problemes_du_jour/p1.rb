# Information
puts("---------------------")
puts("Problème #1 - Convertir Secondes")
puts("Mettre \"break\" afin d'Arrêter le Programme")
loop do
  # Obtenir Valeur de l'Utilisateur
  print("Nombre de Secondes: ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break"

  # Traiter la Valeur Saisie
  secondes = input.to_i()
  continue if secondes == 0

  # Extraire Heures
  heures = secondes / (60 * 60)
  secondes = secondes % (60 * 60)

  # Extraire Minutes
  minutes = secondes / 60
  secondes = secondes % 60

  # Imprimer l'information
  puts("Heures: " + heures.to_s() + ", Minutes: " + minutes.to_s() + ", Secondes: " + secondes.to_s())

  
  # Mettre un Sépérateur
  puts("---------------------")
end
