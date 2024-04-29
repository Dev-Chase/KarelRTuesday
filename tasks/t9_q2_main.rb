#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("t9_q2_robot")

# a task for a stair sweeper
def task()
  world = Robota::World

  runner = Q2Robot.new()
  runner.task()
end


if __FILE__ == $0
  if $graphical
     screen = window(21,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
