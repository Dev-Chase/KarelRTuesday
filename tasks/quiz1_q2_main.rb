#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./grinch.rb")

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/grinch.kwld")

  grinch = Grinch.new()

  while (!grinch.at_end?()) do
    grinch.void_house()
    grinch.next_house()
  end
  grinch.void_house()
  grinch.leave()
end


if __FILE__ == $0
  if $graphical
     screen = window(21,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
