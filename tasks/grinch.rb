# Framework
require_relative("../karel/robota")
require_relative("../karel/ur_robot")

# Personal
require_relative("../mixins/chase_mixin.rb")

class Grinch < UrRobot
  # Inclused Turner and Sensor Pack
  include ChaseMixin
  @@HOUSES_PER_LINE = 3
  @@N_ROWS = 2
  @@FIRST_COL = 4

  # Start with Correct State
  def initialize()
    super(12, 4, Robota::SOUTH, 0)
    @cur_row = 1
    @cur_house = 1
  end

  def enter_and_get_gifts()
    point_at(Robota::SOUTH)
    advance_times(2)
    turn_right()
    move()
    turn_left()
    advance_times(2)
    pick_all_beepers()
    turn_right()
    move()
    pick_all_beepers()
  end

  #NOTE: must start at end of house
  def leave_house()
    point_at(Robota::EAST)
    move()
    turn_left()
    advance_times(2)
    turn_right()
    move()
    turn_left()
    advance_times(2)
  end

  def void_house()
    enter_and_get_gifts()
    leave_house()
  end
  
  def at_end?()
    if @cur_house == @@HOUSES_PER_LINE && @cur_row == @@N_ROWS
      return true
    end
    return false
  end

  # NOTE: Must be Outside of House
  def next_house()
    if (@cur_house == @@HOUSES_PER_LINE)
      point_at(Robota::EAST)
      move()
      turn_right()
      while @street != 6
        move()
      end
      turn_right()
      while @avenue != 4
        move()
      end

      @cur_row += 1
      @cur_house = 1
    else
      point_at(Robota::EAST)
      advance_times(3)
      @cur_house += 1
    end
  end

  def leave()
    point_at(Robota::EAST)
    move()
    turn_right()
    advance_times(3)
    turn_left()
    move()
    turn_right()
    advance_times(2)
    place_all_beepers()
  end
end
