#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t14_q3_robot.rb")

@commandes = %w[move move move move move move move turn_left turn_left turn_left move move move put_beeper]

# a task for a stair sweeper
def task()
  world = Robota::World

  # Question 3
  karel = T14Q3Robot.new(1, 1, Robota::NORTH, Robota::INFINITY)
  karel.execute_commands(@commandes)
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
