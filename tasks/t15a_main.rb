@matrice1 = [43, 34, 6, 73, 7, 33, 73, 87, 443, 7, 32, 8, 442, 6, 2, 5, 0, 44, 3, 4, 342, 66, 554, 7, 56]
@matrice2 = [473, 7, 33, 4, 342, 66, 554, 7, 56, 73, 87, 443, 7, 32, 8, 4423, 34, 6, 9, 2, 5, 0, 44, 64, 3]

def seperate()
  puts("----------------------")
end

def get_max(arr)
  max = arr.first
  arr.each do |x|
    if x > max
      max = x
    end
  end
  return max
end


def get_min(arr)
  min = arr.first
  arr.each do |x|
    if x < min
      min = x
    end
  end
  return min
end


def bubble_sort(arr)
  new_arr = arr
  i = 0
  while i < new_arr.length
    j = 0
    # -1 so as not to compare element with index out of bounds
    while j < new_arr.length - i - 1 
      # Swap if necessary
      if new_arr[j] > new_arr[j + 1]
        temp = new_arr[j + 1]
        new_arr[j + 1] = new_arr[j]
        new_arr[j] = temp
      end
      j += 1
    end
    i += 1
  end

  return new_arr
end

def question1()
  puts("Question 1")
  puts(@matrice1.first)
  puts(@matrice1[0])
end

def question2()
  puts("Question 2")
   puts(@matrice1.first + @matrice1[9])
end

def question3()
  puts("Question 3")
  puts(@matrice1.max + @matrice2.max)
  puts(get_max(@matrice1) + get_max(@matrice2))
end

def question4()
  puts("Question 4")
  puts(@matrice1.min + @matrice2.min)
  puts(get_min(@matrice1) + get_min(@matrice2))
end

def question5()
  puts("Question 5")
  puts("Méthode 1")
  puts("Matrice 1 Min: " + @matrice1.min.to_s + "\n Matrice 2 Min: " + @matrice2.min.to_s)
  puts()
  puts("Méthode 2")
  puts("Matrice 1 Min: " + get_min(@matrice1).to_s + "\n Matrice 2 Min: " + get_min(@matrice2).to_s)
end


def question6()
  puts("Question 6")
  puts("Méthode 1")
  puts((@matrice1 + @matrice2).sort)
  puts()
  puts("Méthode 2")
  puts(bubble_sort((@matrice1 + @matrice2)))
end

question1()
seperate
question2()
seperate
question3()
seperate
question4()
seperate
question5()
seperate
question6()
seperate
