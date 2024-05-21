# Information
puts("--------------------")
puts("Problème #7 - Élément Manquant")

# Informations du Problème
valeurs = array = (1..100).to_a()
valeurs.delete(rand(0..99))

# Imprimer pour Vérification
# puts(valeurs.to_s())

# Compléter le Problème
i = 0
while i < valeurs.length - 1
  if valeurs[i + 1] != valeurs[i] + 1
    puts((valeurs[i] + 1).to_s() + " est la valeur manquante")
  end
  i += 1
end

# Mettre un Sepérateur
puts("--------------------")
