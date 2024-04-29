require_relative("../mixins/turner")
require_relative("../mixins/chase_mixin")
require_relative("../karel/ur_robot")
# require_relative("../karel/robota")

class Ecrivain < UrRobot
  include ChaseMixin

  def initialize(avenue, direction, beepers)
    super(13, avenue, direction, beepers)
  end

  def get_next_avenue()
    return avenue() + 2
  end

  # Start at Top-Left
  def ecrit_lettre()
    raise "implemented in sub-class"
  end
end
