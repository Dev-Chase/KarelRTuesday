require_relative("../karel/robota.rb")
require_relative("./better_init2.rb")

$LOBBY_START_X = 2
$LOBBY_START_Y = 2
$LOBBY_CENTER_START_X = 9
$LOBBY_CENTER_START_Y = 8

$LOBBY_END_X = 31
$LOBBY_END_Y = 19
$LOBBY_CENTER_END_X = 22
$LOBBY_CENTER_END_Y = 13

class Q2Robot < BetterInit2
  def initialize(positions, colour=nil)
    @start_pos = randomize_pos(positions)
    super(@start_pos[0], @start_pos[1], Robota::NORTH, 0, colour)
  end

  def in_center(pos)
    return (pos[0] >= $LOBBY_CENTER_START_X && pos[0] <= $LOBBY_CENTER_END_X)  && (pos[1] >= $LOBBY_CENTER_START_Y && pos[1] <= $LOBBY_CENTER_END_Y)
  end

  def randomize_pos(positions)
    pos = Array.new()
    pos[0] = rand($LOBBY_START_X..$LOBBY_END_X)
    pos[1] = rand($LOBBY_START_Y..$LOBBY_END_Y)

    while (positions.has_key?(pos[0]) && positions[pos[0]] == pos[1]) || in_center(pos)
      pos[0] = rand($LOBBY_START_X..$LOBBY_END_X)
      pos[1] = rand($LOBBY_START_Y..$LOBBY_END_Y)
    end

    positions[pos[0]] = pos[1]
    return pos
  end

  def collect_copy()
    move()
    pick_beeper()
    back_up()
  end

  def corresponding_corridor_target(target_x)
    $MIDDLE_X = ($LOBBY_START_X + $LOBBY_END_X) / 2 
    if target_x < $MIDDLE_X
      return $LOBBY_START_X
    else
      return $LOBBY_END_X
    end
  end

  def exit_shop()
    point_at(Robota::WEST)
    move(2) 
    turn_left()
    move(4)
    turn_left()
    move(2)
    turn_right()
    move(7)
  end

  def return_to_starting_pos()
    exit_shop()

    if @start_pos[1] <= $LOBBY_CENTER_END_Y
      # move x out of way
      point_at(Robota::EAST)
      target = corresponding_corridor_target(@start_pos[0])
      move(target - get_x())
    end

    point_at(Robota::NORTH)
    move(@start_pos[1] - get_y())
    point_at(Robota::EAST)
    move(@start_pos[0] - get_x())
    put_beeper()
  end
end
