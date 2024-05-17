require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin2.rb")

class BetterInit2 < UrRobot
  include ChaseMixin2

  # Makes it (x, y) instead of (y, x) initialization
  def initialize(street, avenue, direction, beepers)
    super(avenue, street, direction, beepers)
  end
end
