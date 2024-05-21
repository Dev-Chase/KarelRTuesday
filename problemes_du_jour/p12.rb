# Information
puts("--------------------")
puts("Problème #12 - Racines et Carrés")

# Compléter le Problème
(1..50).each do |x|
  puts("#%s  Carré:%-5d  Racine:%f" % [x.to_s().rjust(2), x * x, Math.sqrt(x)])
end

# Mettre un Sepérateur
puts("--------------------")
