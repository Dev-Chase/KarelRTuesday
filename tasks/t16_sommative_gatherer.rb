require_relative("../karel/robota")
require_relative("./t16_sommative_q2_robot.rb")
require_relative("./better_init2.rb")
require_relative("./t16_sommative_robot_collection.rb")

class Gatherer < Q2Robot
  def initialize()
    positions = Hash.new()
    # super(8, 19, Robota::WEST, 0)
    @other_people = RobotCollection.new(positions)
    @associated = true
    super(positions)
  end

  def move(n=1)
    super(n)
    if @associated
      @other_people.follow(@direction, n)
      @other_people.add_followers(get_x(), get_y())
    end
  end

  def turn_left(n = 1)
    super(n)
    @other_people.turn_left_followers(n) if @associated
  end

  def right_clear?()
    turn_right()
    res = front_is_clear?()
    turn_left()
    return res
  end

  def travel_row()
    while front_is_clear?()
      move()
      break if done_getting_followers?()
    end
  end

  def next_row(dir)
    move_dir(1, dir)
    turn_left(2)
  end

  def done_getting_followers?()
    return @other_people.get_n_followers() == $TARGET
  end

  def advance_to_wall()
    while front_is_clear?()
      move()
    end
  end

  def collect_copies()
    @associated = false
    collect_copy()
    @other_people.collect_copies()
  end

  def pickup_followers()
    # Set Robot to Starting Position
    get_to_exit_pos()
    turn_left()
    go_to($LOBBY_END_Y, $LOBBY_END_X)
    point_at(Robota::WEST)

    # # Travel Everywhere through Lobby Except Left side of Center
    ($LOBBY_END_Y - $LOBBY_START_Y + 1).times do
      travel_row()
      break if get_y() == $LOBBY_START_Y || done_getting_followers?()
      next_row(Robota::SOUTH)
    end

    # Reposition Robot for Last Section
    if !done_getting_followers?() 
      point_at(Robota::EAST)
      move($LOBBY_CENTER_START_X-1 - get_x())
      point_at(Robota::NORTH)
      move($LOBBY_CENTER_START_Y - get_y())
      point_at(Robota::WEST)
    end

    # Travel through Last Section
    ($LOBBY_CENTER_END_Y - $LOBBY_CENTER_START_Y + 1).times do
      travel_row()
      break if done_getting_followers?()
      next_row(Robota::NORTH)
    end
  end

  def get_followers_at(x, y)
    @other_people.get_followers_at(x, y)
  end

  def get_to_exit_pos()
    $EXIT_POS = [16, $LOBBY_CENTER_END_Y + 1]

    # If Y blocked by center wall, move robot out of way
    x_in_middle = get_x() >= $LOBBY_CENTER_START_X && get_x() <= $LOBBY_CENTER_END_X
    if x_in_middle && get_y() <= $LOBBY_CENTER_END_Y
      point_at(Robota::EAST)
      move($LOBBY_CENTER_START_X-1 - get_x())
    end

    # Move Y to Correct Position
    point_at(Robota::NORTH)
    move($EXIT_POS[1] - get_y())
    
    # Move X to Correct Position
    point_at(Robota::EAST)
    move($EXIT_POS[0] - get_x())

    point_at(Robota::NORTH)
  end

  def enter_shop()
    # Position Correctly
    get_to_exit_pos()

    # Enter Shop
    advance_to_wall()
    turn_right()
    advance_to_wall()
    turn_left()
    advance_to_wall()
    turn_left()
    move(3)
    turn_left()
  end

  def send_back_to_lobby()
    @other_people.send_to_start()
  end
end
