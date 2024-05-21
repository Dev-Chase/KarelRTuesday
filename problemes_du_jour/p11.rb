# Information
puts("--------------------")
puts("Problème #11 - Nombres Premiers")
puts("Saisir \"break\" ou \"exit\" afin d'Arrêter le Programme")

def is_prime?(n)
  (2..Math.sqrt(n).to_i()).each do |x|
    if n % x == 0
      return false
    end
  end

  return true
end

loop do
  # Obtenir Valeur de l'Utilisateur
  print("Donner Nombre Limite: ")
  STDOUT.flush()
  input = gets().chomp()
  break if input == "break" || input == "exit"

  # Traiter la Valeur Saisie
  val = input.to_i()

  # Compléter le Problème
  premiers = (1..val).filter {|x| is_prime?(x)}
  puts("Nombres Premiers de 1 à " + val.to_s() + ": " + premiers.to_s())
  
  # Mettre un Sepérateur
  puts("--------------------")
end
