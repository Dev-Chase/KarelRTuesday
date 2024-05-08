chiffres = [12, 5, 41, 98, 12, 80, 74, 22, 43, 55, 53, 40, 66, 58, 72, 99, 48, 46, 20, 94, 22, 79, 80, 59, 61, 84, 40, 18, 99, 63, 16, 15, 100, 26, 48, 9, 25, 19, 63, 100, 47, 48, 10, 27, 34, 34, 88, 40, 43, 74, 87, 36, 47, 52, 7, 37, 74, 77, 72, 80, 53, 64, 88, 97, 45, 100, 91, 32, 36, 57, 1, 3, 98, 9, 78, 39, 46, 87, 44, 28, 7, 92, 34, 92, 59, 51, 50, 19, 35, 41, 45, 98, 49, 46, 75, 80, 23, 21, 58, 54]

def get_pairs(matrice)
  return matrice.filter {|x| x % 2 == 0}
end

def get_impairs(matrice)
  return matrice.filter {|x| x % 2 == 1}
end

def question1(matrice)
  puts("Question1")

  puts("Pairs")
  pairs = get_pairs(matrice)
  puts(pairs)

  puts("Impairs")
  impairs = get_impairs(matrice)
  puts(impairs)

  puts()
end
def question2(commandes)
  puts("Question2")
  send(commandes)
  puts()
end

question1(chiffres)
question2(chiffres)
