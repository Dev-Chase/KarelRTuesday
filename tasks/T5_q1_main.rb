#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
#require_relative "chase_robot"
require_relative("../karel/ur_robot")

# a task for a stair sweeper
def task()
  karel = UrRobot.new(3, 3, Robota::NORTH, 5)
  i = 0
  while i < 5 do
  	karel.put_beeper()
  	karel.move()
  	i += 1
  end
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