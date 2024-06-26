require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin2.rb")

class BetterInit2 < UrRobot
  include ChaseMixin2

  # Makes it (x, y) instead of (y, x) initialization
  def initialize(street, avenue, direction, beepers, colour=nil)
    super(avenue, street, direction, beepers, colour)
  end

  def get_pos()
    return[get_x(), get_y()]
  end
end
