def question1()
  puts("Question 1")
  puts(rand(0..20))
end

def question2()
  puts("Question 2")
  n = rand(0..20)
  puts(n) if n <= 10
end

def question3()
  puts("Question 3")
  a = rand(0..20)
  puts(a)

  b = rand(0..20)
  puts(b)
  if a > b
    puts("a")
  else b > a
    puts("b")
  end
end


question1()
question2()
question3()
