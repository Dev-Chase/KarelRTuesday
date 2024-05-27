require_relative("../karel/robota")
require_relative("./t16_sommative_gathered_robot.rb")
require_relative("../mixins/chase_mixin2.rb")

class RobotCollection
  def initialize(positions)
    @interested_robots = (1..$N_INTERESTED).map {|x| GatheredRobot.new(positions)}
    @followers = Array.new()
  end

  def add_followers(x, y)
    new_followers = @interested_robots.each_index.filter {|i| @interested_robots[i].at?(x, y) && !@followers.include?(i)}
    @followers = @followers + new_followers
  end

  def get_n_followers()
    return @followers.length
  end

  def collect_copies()
    @followers.each do |i|
      @interested_robots[i].collect_copy()
    end
  end

  def follow(dir, n=1)
    @followers.each do |i|
      @interested_robots[i].point_at(dir)
      @interested_robots[i].move(n)
    end
  end

  def turn_left_followers(n = 1)
    @followers.each do |i|
      @interested_robots[i].turn_left(n)
    end
  end

  def get_followers_at(x, y)
    return @followers.filter {|i| @interested_robots[i].at?(x, y)}
  end

  def send_to_start()
    @followers.each do |i|
      @interested_robots[i].return_to_starting_pos()
    end
  end
end
