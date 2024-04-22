#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
require_relative("../mixins/T6_mixins_module.rb")

include T6MixinsModule

# a task for a stair sweeper
def task()
  karel = UrRobot.new(1, 6, Robota::EAST, 20)
  karel.go_to(5, 2)
  karel.point_at(Robota::EAST)
  karel.make_pyramid(4, Robota::SOUTH)
  karel.go_to(5, 2)
  karel.point_at(Robota::EAST)
  karel.make_pyramid(4, Robota::NORTH)
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
