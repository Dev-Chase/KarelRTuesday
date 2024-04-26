#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin.rb")

include ChaseMixin

def complete_circuit(robots, start_i)
  i = start_i
  while i < start_i + robots.length() - 1 do
    robots[i % robots.length()].go_to(robots[i + 1].street, robots[i + 1].avenue)
    robots[i % robots.length()].put_beeper()
    robots[(i + 1) % robots.length()].pick_beeper()

    i += 1
  end

end

# a task for a stair sweeper
def task()
  world = Robota::World

  # Define Robots
  robots = Array[
    UrRobot.new(1, 1, Robota::NORTH, 1, "red"),
    UrRobot.new(6, 1, Robota::EAST, 0, "green"),
    UrRobot.new(6, 6, Robota::SOUTH, 0, "yellow"),
    UrRobot.new(1, 6, Robota::WEST, 0, "orange"),
    UrRobot.new(1, 1, Robota::NORTH, 0, "blue")
  ]

  i = 0
  while i >= -3 do
    complete_circuit(robots, i)
    i -= 1
  end

end


if __FILE__ == $0
  if $graphical
     screen = window(10, 80) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
