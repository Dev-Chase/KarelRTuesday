#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t10_q1_robot.rb")

matrice = [364, 204, 165, 391, 170, 180, 1, 5, 225, 31, 309, 461, 166, 50, 53, 71, 235, 198, 28, 231, 16, 80, 497, 317, 497, 280, 261, 52, 57, 364, 206, 101, 72, 152, 361, 81, 3, 22, 256, 409, 54, 18, 112, 162, 495, 51, 287, 63, 241, 417, 244, 306, 218, 293, 151, 499, 78, 458, 12, 342, 497, 331, 273, 370, 418, 382, 79, 119, 132, 286]

hachage = {"val0"=>55, "val1"=>323, "val2"=>38, "val3"=>99, "val4"=>64, "val5"=>75, "val6"=>32, "val7"=>53, "val8"=>7, "val9"=>1 }

def question1(matrice)
  puts("Question1")
  puts("Methode 1")
  puts(matrice.sort()[-1])
  puts("Methode 2 (plus intuitive)")
  puts(matrice.max())
  puts()
end
def question2(matrice)
  puts("Question2")
  puts(matrice.length)
  puts()
end

def question3(hachage)
  puts("Question3")
  puts("Methode 1")
  puts(hachage.values.include?(6))
  puts("Methode 2 (plus intuitive)")
  puts(hachage.has_value?(6))
  puts()
end

def question4(hachage)
  puts("Question4")
  puts(hachage["val7"])
  puts()
end

def question5(hachage)
  puts("Question5")
  puts(hachage["val4"] + hachage["val9"])
  puts()
end

question1(matrice)
question2(matrice)
question3(hachage)
question4(hachage)
question5(hachage)
