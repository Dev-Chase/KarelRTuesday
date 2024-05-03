#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t10_q1_robot.rb")
require_relative("./t10_q2_robot.rb")
require_relative("./t10_q3_robot.rb")
require_relative("./t10_q4_robot.rb")

# N_LINES = 9
N_COLS = 10

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")

  # Can Move
  question1 = T10Q1Robot.new(12, 1, Robota::EAST, 0)
  question1.move()

  # Can't Move
  question2 = T10Q2Robot.new(11, 1, Robota::EAST, 0)
  question2.move()

  # Aléatoire 1
  question3 = T10Q3Robot.new(2, 11, Robota::EAST, 0)
  question3.wipe_board()

  # Aléatoire 2
  world.read_world("../worlds/aleatoire.kwld")
  question4 = T10Q4Robot.new(2, 11, Robota::EAST)
  question4.wipe_board()
end


if __FILE__ == $0
  if $graphical
     screen = window(18,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
