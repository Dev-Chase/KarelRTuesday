# Information
puts("--------------------")
puts("Problème #10 - Palindrome")
puts("Saisir \"break\" ou \"exit\" afin d'Arrêter le Programme")

loop do

  # Obtenir Valeur de l'Utilisateur
  print("Mot à Vérifier: ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break" || input == "exit"

  # Compléter le Problème
  mot = input.chomp().downcase().chars().filter {|char| char != ' '}
  resultat = (mot == mot.reverse()) ? " est " : " n'est pas "
  puts(mot.join().to_s() + resultat + "un palindrome")
  
  # Mettre un Sepérateur
  puts("--------------------")
end
