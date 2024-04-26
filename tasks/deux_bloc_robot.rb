require_relative("../mixins/turner")
require_relative("../mixins/T7_mixin.rb")
require_relative("../karel/ur_robot")

class DeuxBlocRobot < UrRobot
  include T7Mixin
  include Turner

  def move()
	super()
	super()
  end
end
