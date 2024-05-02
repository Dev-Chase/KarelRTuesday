#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./quiz1_q1_robot.rb")

# a task for a stair sweeper
def task()
  bell_placer = Quiz1Q1Robot.new()
  bell_placer.create_line(1)
  bell_placer.create_line(3)
  bell_placer.create_line(3)
  bell_placer.create_line(3)
  bell_placer.create_line(3)
  bell_placer.create_line(5)
  bell_placer.create_line(7)
  bell_placer.create_line(1)
end


if __FILE__ == $0
  if $graphical
     screen = window(6*2,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
