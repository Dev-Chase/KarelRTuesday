require_relative("../karel/robota.rb")
require_relative("./better_init2.rb")

class RightTurner < BetterInit2
  NextRightDirection = {Robota::NORTH => Robota::EAST, Robota::EAST => Robota::SOUTH, Robota::SOUTH => Robota::WEST, Robota::WEST => Robota::NORTH}

  def next_right_dir(dir)
    return NextRightDirection[dir]
  end

  def turn_right()
    puts(next_right_dir(@direction))
    pause("turn_right")
    raise RobotNotRunning, " while turning right" if ! @runstate
    @direction = next_right_dir(@direction)
    changed
    notify_observers(self, RobotWorldBase::TURN_RIGHT_ACTION, state)
    return self
  end
end
