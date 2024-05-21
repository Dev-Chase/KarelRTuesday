# Information
puts("Problème #5 - Somme des Nombres Pairs")

# Informations du Problème
valeurs = Array.new(200) { rand(0..100) }

# Compléter le Problème
puts("Sum: " + valeurs.filter {|val| val % 2 == 0 }.sum.to_s())

# Mettre un Sepérateur
puts("--------------------")
