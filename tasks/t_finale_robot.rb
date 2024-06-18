require_relative("../karel/robota")
require_relative("./better_init2.rb")
require_relative("../mixins/chase_mixin2.rb")


class TFinaleRobot < BetterInit2
  include ChaseMixin2

  def initialize()
    super(1, 1, Robota::EAST, 0)
  end

  #NOTE: unnecessary because defined in ChaseMixin2
  # def put_beeper()
  #   super() if any_beepers_in_beeper_bag?()
  # end
  # def pick_beeper()
  #   super($ALL)
  #   super() if next_to_a_beeper?($ALL)
  # end

  def next_row()
    move_dir(1, Robota::NORTH)
    turn_left(2)
  end
def collect_row()
    ($SQUARE_SIZE - 1).times do
      pick_beeper($ALL)
      move()
    end
  end

  def collect_beepers()
    $SQUARE_SIZE.times do
      collect_row()
      next_row()
    end
  end

  def return_to_start()
    go_to(1, 1)
    point_at(Robota::EAST)
  end

  def place_collumn(n)
    put_beeper_advance(n)
    move(-n)
  end

  def next_collumn()
    turn_right()
    move()
  end

  def place_collumns()
    # Return to Starting Position
    return_to_start()

    # Get User Input
    print("Combien de colonnes voules-vous: ")
    STDOUT.flush()
    n_collumns = gets().chomp().to_i()

    # Place Collumns
    n_collumns.times do |i|
      point_at(Robota::NORTH)
      place_collumn(i+1)
      next_collumn()
    end
  end
end
