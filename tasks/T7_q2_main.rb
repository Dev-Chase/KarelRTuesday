#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("../karel/ur_robot")
require_relative("../mixins/T7_mixin.rb")

include T7Mixin

def next_right_direction(dir)
  return Robota.next_direction(Robota.next_direction(Robota.next_direction(dir)))
end

def task()
  world = Robota::World
  world.read_world("../worlds/T7_q2.kwld")

  karel = UrRobot.new(8, 6, Robota::EAST, 78)

  cur_dir = Robota::EAST
  i = 0
  while i < 4 do # Four Quadrants
    j = 0
    while j < 3 do # Three "Steps" per Quadrant
      karel.climb_step(cur_dir, next_right_direction(cur_dir))
      karel.place_beeper_times((i * 3) + j + 1)
      j += 1
    end

    # Next Loop
    cur_dir = next_right_direction(cur_dir)
    i += 1
  end
  karel.move()
end


if __FILE__ == $0
  if $graphical
     screen = window(10,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
