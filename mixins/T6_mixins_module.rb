require_relative("sensor_pack")
require_relative("turner")
require_relative("chase_mixin")
require_relative("../karel/robota")

module T6MixinsModule
  include SensorPack
  include Turner
  include ChaseMixin

  #NOTE: must have enough beepers
  def make_pyramid(width, dir)
    unit = 4
    i = 0
    while i < unit do
      j = 0
      while j < unit - i do
        if j != 0
          move()
        end
        move_and_place()

        j += 1
      end

      point_at(dir)
      move()
      point_at((i % 2 == 1) ? Robota::EAST : Robota::WEST)
      i += 1
    end
  end
end
