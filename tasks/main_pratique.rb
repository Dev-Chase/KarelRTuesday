#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "pratique"
require_relative "../karel/robota"

# a task for a stair sweeper
def task()
  
  karel = Pratique.new(1, 1, Robota::EAST, 50)
  karel.move_5
  karel.mettre_5_beepers
  karel.turn_around
  karel.diagonale_droit
  karel.put_beeeper
  karel.turn_off
  
end

if __FILE__ == $0
  if $graphical
     screen = window(8, 40) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end