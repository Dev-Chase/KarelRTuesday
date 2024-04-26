#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
require_relative("robot_face_nord")

# a task for a stair sweeper
def task()
  world = Robota::World

  karel = RobotFaceNord.new(5, 5, Robota::EAST, (8 * 4) - 1)
  karel.go_to(1, 1)
end


if __FILE__ == $0
  if $graphical
     screen = window(10,   75) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
