require_relative("sensor_pack")
require_relative("turner")
require_relative("chase_mixin")
require_relative("../karel/robota")

module T7Mixin
  include SensorPack
  include Turner
  include ChaseMixin

  def climb_step(dir_a, dir_b)
    point_at(dir_a)
    move()
    point_at(dir_b)
    move()
  end

  # NOTE: must have enough beepers
  def make_square(width, start_dir, clockwise)
    point_at(start_dir)
    i = 0
    while i < 4 do
      # Make Line
      j = 0
      while j < width - 1 do
        move()
        put_beeper()
        j += 1
      end

      # Turn Corner
      clockwise ? turn_right() : turn_left()
      i += 1
    end
  end
end
