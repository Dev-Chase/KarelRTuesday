# Information
puts("Problème #2 - Moyenne des Notes")

# Informations du Problème
notes = Array.new(200) { rand(20..100) }

# Compléter le Problème
puts("La Moyenne est de: " + (notes.sum() / notes.length()).to_s())

# Mettre un Espace
puts()
