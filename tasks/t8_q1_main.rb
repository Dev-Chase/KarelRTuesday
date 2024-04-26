#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
require_relative("deux_bloc_robot")

# a task for a stair sweeper
def task()
  world = Robota::World

  karel = DeuxBlocRobot.new(1, 1, Robota::EAST, (8 * 4) - 1)
  karel.make_square(3, Robota::EAST, false)
end


if __FILE__ == $0
  if $graphical
     screen = window(10,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
