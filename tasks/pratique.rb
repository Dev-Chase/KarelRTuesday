require_relative "../karel/ur_robot"

class Pratique < UrRobot

	def move_5
		move
		move
		mov
		move
		move
	end 

	def mettre_5_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
	end

	def diagonale_droit
		move
		turn_right
		move
		turn_left
	end

	def diagonale_gauche
		move
		turn_left
		move
		turn_right		
	end


end

