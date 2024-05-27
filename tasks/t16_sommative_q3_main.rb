#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t16_sommative_q3_robot.rb")

def task()
  world = Robota::World
  world.read_world("../worlds/bouger.kwld")

  karel = T16SommativeQ3Robot.new()
  karel.cut_and_paste()
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
