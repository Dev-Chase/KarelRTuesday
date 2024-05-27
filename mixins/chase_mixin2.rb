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

  def get_x()
    return @avenue
  end

  def get_y()
    return @street
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
  # NOTE: can move backwards
  def move(n = 1)
    turn_left(2) if n < 1
    n.abs.times do
      if front_is_clear?()
        super()
      else
        puts("Would've hit wall at (" + @avenue.to_s() + ", " + @street.to_s() + ")")
      end
    end
    turn_left(2) if n < 1
  end

  def back_up(n = 1)
    turn_left(2)
    n.times do
      move()
    end
    turn_left(2)
  end

  def put_beeper(n = 1)
    if n == $ALL
      while any_beepers_in_beeper_bag?()
        super()
      end
      return
    end

    n.times do
      super() if any_beepers_in_beeper_bag?()
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

  def pick_beeper(n = 1)
    if n == $ALL
      while next_to_a_beeper?()
        super()
      end
      return
    end

    n.times do
      super() if next_to_a_beeper?()
    end
  end

  def pick_beeper_advance(n = 1)
    n.times do
      pick_beeper()
      move()
    end
  end

  def advance_pick_beeper(n = 1)
    n.times do
      move()
      pick_beeper()
    end
  end

  # Move n Times in Dir Direction and Turn Back
  def move_dir(n, dir)
    cur_dir = @direction
    point_at(dir)
    move(n)
    point_at(cur_dir)
  end

  #NOTE: x, y
  def go_to(street, avenue, direction = nil)
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

    point_at(direction) if direction != nil
  end
end
