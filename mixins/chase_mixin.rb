require_relative("sensor_pack")
require_relative("turner")
require_relative("../karel/robota")

module ChaseMixin
  include SensorPack
  include Turner

  # Accessor Methods
  def street()
    return @street
  end

  def avenue()
    return @avenue
  end

  # Turning Methods
  def point_at(dir)
    while (@direction != dir)
      turn_left()
    end
  end

  def turn_times(n)
    i = 0
    while i < n do
      turn_left()
    end
  end

  # Movement and Beeper Methods
  def advance_times(n)
    i = 0
    while i < n do
      move()
      i += 1
    end
  end

  def advance_put_beeper()
    move()
    put_beeper()
  end

  def advance_put_beeper_times(n)
    i = 0
    while i < n do
      advance_put_beeper()
      i += 1
    end
  end

  def place_beeper_times(n)
    i = 0
    while i < n do
      put_beeper()
      i += 1
    end
  end

  def go_to(street, avenue)
    # Figure out desired horizontal direction & point at it
    point_at(avenue < @avenue ? Robota::WEST : Robota::EAST)

    # Advance until desired street
    while @avenue != avenue do
      move()
    end

    # Figure out desired vertical direction & point at it
    point_at(street > @street ? Robota::NORTH : Robota::SOUTH)

    # Advance until desired avenue
    while @street != street do
      move()
    end
  end
end
