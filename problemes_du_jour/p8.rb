# Information
puts("--------------------")
puts("Problème #8 - Lettre Présent dans Mot")
puts("Saisir \"break\" ou \"exit\" afin d'Arrêter le Programme")

def get_input(question)
  print(question)
  STDOUT.flush()
  return gets().chomp()
end

loop do

  # Obtenir Information de l'Utilisateur
  mot = get_input("Mot: ")
  break if mot == "break" || mot == "exit"
  lettre = get_input("Lettre: ")
  break if lettre == "break" || lettre == "exit"

  # Traiter la Valeur Saisie
  resultat = (mot.include?(lettre)) ? " contient " : " ne contient pas "

  # Compléter le Problème
  puts(mot + resultat + lettre)
  
  # Mettre un Sepérateur
  puts("--------------------")
end
