require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin.rb")

class BetterInit < UrRobot
  include ChaseMixin
  # Makes it (x, y) instead of (y, x) initialization
  def initialize(avenue, street, direction, beepers)
    super(street, avenue, direction, beepers)
  end
end
