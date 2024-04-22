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
  karel = UrRobot.new(5, 2, Robota::EAST, 10)
  karel.make_pyramid(4, Robota::SOUTH)
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
