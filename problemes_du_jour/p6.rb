# Information
puts("--------------------")
puts("Problème #6 - Plus Frequent")

# Informations du Problème
valeurs = Array.new(200) { rand(0..100) }

# Creer un Hash avec La Fréquence de chaque Élément
frequence = Hash.new()
valeurs.each do |val|
  if !frequence.include?(val)
    frequence[val] = 1
  else
    frequence[val] += 1
  end
end

# Imprimer la liste pour vérifier le résultat
# puts("Hash de Frequence:")
# puts(frequence)
# puts("----------")

# Obtenir la plus grande fréquence
max_frequence = frequence.values.max

# Obtenir tous les nombres avec cette fréquence
ans = frequence.keys.filter {|val| frequence[val] == max_frequence}

# Imprimer le résultat
puts(ans.to_s() + " sont les nombres les plus fréquentes avec " + max_frequence.to_s() + " occurences.")

# Mettre un Sepérateur
puts("--------------------")
