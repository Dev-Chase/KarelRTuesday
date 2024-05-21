# Information
puts("---------------------")
puts("Problème #3 - Trouver Nom")
puts("Mettre \"break\" afin d'Arrêter le Programme")
loop do

  # Obtenir Valeur de l'Utilisateur
  print("Saisir un nom: ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break" || input == "exit"

  # Informations du Problème
  noms = ["Alice", "Bob", "Charlie", "David", "Emma", "Frank", "Grace", "Henry", "Ivy", "Jack", "Kate", "Liam", "Mia", "Noah", "Olivia", "Peter", "Quinn", "Rachel", "Sam", "Tina"]

  # Traiter la Valeur Saisie
  nom = input

  # Compléter le Problème
  res = (noms.include?(nom)) ? " est " : " n'est pas "
  puts(nom + res + "dans la liste de noms.")
  
  # Mettre un Sépérateur
  puts("---------------------")
end
