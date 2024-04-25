#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
require_relative("../mixins/T7_mixin.rb")

include T7Mixin

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/T7_q1.txt")

  karel = UrRobot.new(9, 2, Robota::EAST, (8 * 4) - 1)
  karel.make_square(8, Robota::SOUTH, false)
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
