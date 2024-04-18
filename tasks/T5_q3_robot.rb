require_relative("T5_q2_robot")
require_relative("../mixins/turner")
#require_relative("../karel/robota")

class T5Q3Robot < T5Q2Robot
	def turn_right()
		turn_left()
		turn_left()
		turn_left()
	end

	def place_5_by_5_grid()
		for i in 0..4
			place_5_beepers()
			if i % 2 == 0
				turn_right()
				move()
				turn_right()
				move()
			else
				turn_left()
				move()
				turn_left()
				move()
			end
		end
	end
end