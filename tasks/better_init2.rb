require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin2.rb")

class BetterInit2 < UrRobot
  include ChaseMixin2

  # Makes it (x, y) instead of (y, x) initialization
  def initialize(avenue, street, direction, beepers)
    super(street, avenue, direction, beepers)
  end
end
