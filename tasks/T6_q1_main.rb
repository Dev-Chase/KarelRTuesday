#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
# require_relative("../worlds/T6_q1_world.txt")

# a task for a stair sweeper
def task()
  # karel = UrRobot.new(3, 3, Robota::NORTH, 5)
  world = Robota::World
  world.read_world("../worlds/T6_q1_world.txt")
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
