#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t14b_robot_labyrinthe.rb")

def task()
  world = Robota::World
  world.read_world("../worlds/labyrinthe.kwld")

  karel = T14bRobotLabyrinthe.new(2, 20, Robota::SOUTH, 0)
  karel.echappe_labyrinthe()
  # karel.move_until_next_path()
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
