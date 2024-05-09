require_relative("sensor_pack")
require_relative("turner")
require_relative("../karel/robota")

$ALL = -1
module ChaseMixin2
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

  def turn_left(n = 1)
    n.times do
      super()
    end
  end

  # Movement and Beeper Methods
  def move(n = 1)
    n.times do
      if front_is_clear?()
        super()
      else
        puts("Would've hit wall at (" + @avenue.to_s() + ", " + @street.to_s() + ")")
      end
    end
  end

  def back_up(n = 1)
    n.times do
      back_up()
    end
  end

  def advance_put_beeper(n = 1)
    n.times do
      move()
      put_beeper()
    end
  end

  def put_beeper_advance(n = 1)
    n.times do
      put_beeper()
      move()
    end
  end

  def put_beeper(n = 1)
    if n == ALL
      while any_beepers_in_beeper_bag?()
        put_beeper()
      end
      return
    end

    n.times do
      if any_beepers_in_beeper_bag?()
        super()
      else
        puts("No more beepers in bag!")
      end
    end
  end

  def pick_beepers(n = 1)
    if n == ALL
      while next_to_a_beeper?()
        pick_beeper()
      end
      return
    end

    n.times do
      if next_to_a_beeper?()
        pick_beeper()
      else
        puts("No beeper to pick up!")
      end
    end
  end

  # Move n Times in Dir Direction and Turn Back
  def move_dir(n, dir)
    cur_dir = @direction
    point_at(dir)
    move(n)
    point_at(cur_dir)
  end

  def go_to(street, avenue)
    # Figure out desired horizontal direction & point at it
    point_at(avenue < @avenue ? Robota::WEST : Robota::EAST)

    # Advance until desired street
    while @avenue != avenue
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
