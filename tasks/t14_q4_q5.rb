# pourquoi ne pas juste utiliser une variable qui est incrémenté chaque fois?
def question4()
  puts("Question4")
  puts("Guess the Random Number (1<=n>=100)!")

  n = rand(1..100)
  guesses = []
  guess = gets.chomp().to_i()
  until guess == n
    if guess < n
      puts("Higher")
    else guess > n
      puts("Lower")
    end

    guesses << guess
    guess = gets.chomp().to_i()
  end

  puts("Correct!")
  puts("It took you " + guesses.length.to_s() + " tries to guess that!")
  puts()
end

def question5()
  puts("Question5")

  a = rand(1..50)
  b = rand(1..50)
  sum = a + b

  puts("What is the sum of " + a.to_s() + " and " + b.to_s() + "?")
  guess = gets.chomp().to_i()
  until guess == sum
    if guess < sum
      puts("Incorrect, sum is larger")
    else
      puts("Incorrect, sum is smaller")
    end
    guess = gets.chomp().to_i()
  end
  puts("Correct!")
  
  puts()
end

# question4()
question5()
