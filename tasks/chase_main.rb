#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative "chase_robot"

# a task for a stair sweeper
def task()
  karel = ChaseRobot.new(2, 2, Robota::WEST, 0);
  karel.recule()
end


if __FILE__ == $0
  if $graphical
     screen = window(8,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end