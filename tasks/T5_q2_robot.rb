require_relative("../karel/ur_robot")
require_relative("../mixins/turner")
#require_relative("../karel/robota")

class T5Q2Robot < UrRobot 
	def place_5_beepers()
		for i in 0..4 do
			put_beeper()
			move()
		end
	end
end