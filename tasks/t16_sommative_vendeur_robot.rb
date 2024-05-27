require_relative("../karel/robota")
require_relative("./better_init2.rb")
require_relative("../mixins/chase_mixin2.rb")

class SalesRobot < BetterInit2
  def initialize()
    super(15, 29, Robota::NORTH, Robota::INFINITY, :orange)
  end

  def give_copies(gatherer)
    n_followers = gatherer.get_followers_at(get_x(), get_y() + 1).length
    if n_followers >= $MIN_INTERESTED
      if n_followers > $MIN_INTERESTED
        puts("Wow ! C'est beaucoup de personnes, bon job !")
      else
        puts("C'est juste assez, merci pour l'effort !")
      end
      puts("Voici #{n_followers} copies pour les personnes que vous avez trouvé, et 1 pour vous.")
      put_beeper(n_followers + 1)
    else
      raise("${n_followers} n'est pas assez de personnes, vous êtes licencié!")
    end
  end
end
