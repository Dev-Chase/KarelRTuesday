require_relative("../mixins/turner")
require_relative("ecrivain_h")
require_relative("ecrivain_e")
require_relative("ecrivain_l")
require_relative("ecrivain_o")
require_relative("../karel/robota")

class Q2Robot
  def task()
  	h_letter = EcrivainH.new(1)
  	h_letter.ecrit_lettre()

  	e_letter = EcrivainE.new(h_letter.get_next_avenue())
  	e_letter.ecrit_lettre()

  	l1_letter = EcrivainL.new(e_letter.get_next_avenue())
  	l1_letter.ecrit_lettre()

  	l2_letter = EcrivainL.new(l1_letter.get_next_avenue())
  	l2_letter.ecrit_lettre()

  	o_letter = EcrivainO.new(l2_letter.get_next_avenue())
  	o_letter.ecrit_lettre()
	#TODO: implement
  end
end
