require_relative("../karel/ur_robot")
require_relative("../mixins/turner.rb")

class Pratique < UrRobot
  include Turner  
  def move_5()
	  move()
	  move()
	  move()
	  move()
	  move()
  end 

  def mettre_5_beepers()
	  put_beeper()
	  put_beeper()
	  put_beeper()
	  put_beeper()
	  put_beeper()
  end

  def diagonale_droit()
	  move()
	  turn_right()
	  move()
	  turn_left()
  end

  def diagonale_gauche()
	  move()
	  turn_left()
	  move()
	  turn_right()
  end

  def turn_around()
  	turn_left()
  	turn_left()
  	turn_left()
  	turn_left()
  end
end

