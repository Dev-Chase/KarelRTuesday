#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative("../karel/robota")
require_relative("./right_turner.rb")

# a task for a stair sweeper
def task()
  world = Robota::World

  karel = RightTurner.new(1, 1, Robota::NORTH, 0)
  karel.turn_right()
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
