require_relative("../karel/robota")
require_relative("./better_init.rb")
require_relative("../mixins/chase_mixin.rb")


class T14Q3Robot < BetterInit
  def execute_commands(commands)
    commands.each {|command| send(command)}
  end
end
