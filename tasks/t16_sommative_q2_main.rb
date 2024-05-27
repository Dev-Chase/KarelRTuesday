#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/robota"
require_relative("./t16_sommative_vendeur_robot.rb")
require_relative("./t16_sommative_gatherer.rb")

$N_INTERESTED = 22
$MIN_INTERESTED = 18
$TARGET = $N_INTERESTED
def task()
  world = Robota::World
  world.read_world("../worlds/quake-open.kwld")

  puts("Vous êtes un employé d'un magasin locale de jeux vidéos. Vous êtes chargés d'apporter le plus grand montant de personnes possible à votre magasin afin de vider le stockage du vieux jeu vidéo : Quake.\nVous vous trouvez courrament dans une position aléatoire de centre commercial dans lequel votre magasin se trouve. Vous devez trouvez au moins #{$MIN_INTERESTED} personnes (qui se trouve aussi dans une position aléatoire dans le centre commercial) afin de compléter votre tâche et les rapporter à votre magasin. Bonne chance !\n\n")
  gatherer = Gatherer.new()
  sales_robot = SalesRobot.new()
  gatherer.pickup_followers()
  gatherer.enter_shop()
  sales_robot.give_copies(gatherer)
  gatherer.collect_copies()
  gatherer.send_back_to_lobby()
end

if __FILE__ == $0
  if $graphical
     screen = window(31,   100) # (size, speed)
     screen.run do
       task()
     end
   else
     task()
   end
end
