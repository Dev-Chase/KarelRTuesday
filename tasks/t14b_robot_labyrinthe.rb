require_relative("../karel/robota")
require_relative("./better_init2.rb")
require_relative("../mixins/chase_mixin2.rb")


class T14bRobotLabyrinthe < BetterInit2
  include ChaseMixin2

  def left_clear?()
    turn_left()
    clear = front_is_clear?()
    turn_right()
    return clear
  end

  # # NOTE: Must be placed in entrance facing towards labyrinthe
  def enter_labyrinthe()
    # Enter
    move()

    # Go Against Wall
    while left_clear?()
      turn_left()
      move()
    end

  end

  def position_correctly()
    while left_clear?() || !front_is_clear?()
      turn_left()
    end
  end

  def move_until_next_path()
    while front_is_clear?() && !left_clear?() && !next_to_a_beeper?()
      move()
    end
  end
  
  def follow_around_corner()
    while left_clear?()
      turn_left()
      move()
    end
  end

  # NOTE: must start with a wall on one of four sides of robot
  def echappe_labyrinthe()
    enter_labyrinthe()

    until next_to_a_beeper?()
      position_correctly()
      move_until_next_path()
      follow_around_corner() # check not necessary, done in loop
    end

    pick_beeper()
    move()
  end
end
