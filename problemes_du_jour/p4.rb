# Information
puts("--------------------")
puts("Problème #4 - Mot de Passe")
puts("Mettre \"break\" afin d'Arrêter le Programme")
loop do
  # Obtenir Valeur de l'Utilisateur
  print("Saisir un mot de passe: ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break" || input == "exit"

  # Informations du Problème
  utilisateurs = {
    "user1" => "password1",
    "user2" => "password2",
    "user3" => "password3",
    "user4" => "password4",
    "user5" => "password5",
    "user6" => "password6",
    "user7" => "password7",
    "user8" => "password8",
    "user9" => "password9",
    "user10" => "password10",
    "user11" => "password11",
    "user12" => "password12",
    "user13" => "password13",
    "user14" => "password14",
    "user15" => "password15",
    "user16" => "password16",
    "user17" => "password17",
    "user18" => "password18",
    "user19" => "password19",
    "user20" => "password20"
  }

  # Traiter la Valeur Saisie
  val = input

  # Compléter le Problème
  if utilisateurs.values.include?(val)
    puts("Accès autorisé, compte: " + utilisateurs.key(val))
  else
    puts("Accès Refusé")
  end  
  # Mettre un Sepérateur
  puts("--------------------")
end
