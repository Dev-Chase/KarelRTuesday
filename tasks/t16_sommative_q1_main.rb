#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t16_sommative_q1_robot.rb")

# Option A) (rectangle)
def task()
  world = Robota::World
  world.read_world("../worlds/rectangle.kwld")

  karel = T16SommativeQ1Robot.new()
  karel.start_square()
end


if __FILE__ == $0
  if $graphical
     screen = window(20,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
