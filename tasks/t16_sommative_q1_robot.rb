require_relative("../karel/robota")
require_relative("./better_init2.rb")
require_relative("../mixins/chase_mixin2.rb")

# Choisi de faire option a
$SQUARE_SIZE = 18
$START_DIR = Robota::EAST
$START_POS_X = 2
$START_POS_Y = 2

class T16SommativeQ1Robot < BetterInit2
  def initialize()
    super($START_POS_X, $START_POS_Y, $START_DIR, $SQUARE_SIZE * $SQUARE_SIZE)
  end

  def beeper_action()
    if next_to_a_beeper?()
      pick_beeper()
    else
      put_beeper()
    end
  end

  def complete_row()
    while front_is_clear?()
      beeper_action()
      move()
    end
    beeper_action()
  end

  def next_row()
    # Get Next Desired Direction
    next_dir = Robota.next_direction(Robota.next_direction(@direction))
    point_at(Robota::NORTH)
    move()
    point_at(next_dir)
  end

  def at_end?()
    return false if @direction == $START_DIR
    point_at(Robota::NORTH)
    res = !front_is_clear?()    
    point_at(Robota.next_direction(Robota.next_direction($START_DIR))) 
    return res
  end

  def return_to_start()
    go_to($START_POS_X, $START_POS_Y)
    point_at($START_DIR)
  end

  def start_square()
    loop do
      complete_row()

      if !at_end?()
        next_row()
      else
        return_to_start()
      end
    end
  end
end
