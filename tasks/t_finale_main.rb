#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t_finale_robot.rb")

$SQUARE_SIZE = 13
def task()
  world = Robota::World
  world.read_world("../worlds/tache_finale_b.kwld")

  karel = TFinaleRobot.new()
  karel.collect_beepers()
  karel.place_collumns()
  karel.return_to_start()
end


if __FILE__ == $0
  if $graphical
     screen = window($SQUARE_SIZE,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
