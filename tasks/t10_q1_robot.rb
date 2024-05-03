require_relative("../karel/robota")
require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin.rb")

class T10Q1Robot < UrRobot
  include ChaseMixin # includes SensorPack
  def move()
    super() if front_is_clear?()
  end
end
