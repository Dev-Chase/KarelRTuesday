require_relative("../karel/robota")
require_relative("./better_init2.rb")
require_relative("../mixins/chase_mixin2.rb")

# Copier un "image" d'une position à une autre
class T16SommativeQ3Robot < BetterInit2
  def initialize()
    super(2, 5, Robota::NORTH, 0)

    # NOTE: Position est du gauche, en bas
    @image_x = 0
    @image_y = 0
    @image_new_x = 0
    @image_new_y = 0

    @image_width = 0
    @image_height = 0

    @image_info = Array.new()
  end

  def get_information()
    print("Image X:")
    STDOUT.flush()
    @image_x = gets().chomp().to_i()

    print("Image Y:")
    STDOUT.flush()
    @image_y = gets().chomp().to_i()

    print("Image Largeur:")
    STDOUT.flush()
    @image_width = gets().chomp().to_i()

    print("Image Hauteur:")
    STDOUT.flush()
    @image_height = gets().chomp().to_i()

    print("Nouveau Image X:")
    STDOUT.flush()
    @image_new_x = gets().chomp().to_i()

    print("Nouveau Image Y:")
    STDOUT.flush()
    @image_new_y = gets().chomp().to_i()
  end

  #NOTE: start at top of collumn
  def next_collumn()
    point_at(Robota::SOUTH)
    move(@image_height)
    turn_left()
    move()
    turn_left()
  end

  def copy_collumn()
    point_at(Robota::NORTH)
    collumn = Array.new()
    
    @image_height.times do
      collumn << next_to_a_beeper?() 
      move()
    end 

    @image_info << collumn
    # back_up(@image_height)
  end

  def copy_image()
    go_to(@image_y, @image_x)
    @image_width.times do
      copy_collumn()
      next_collumn()
    end
  end

  def delete_image()
    go_to(@image_y, @image_x)
    @image_width.times do
      point_at(Robota::NORTH)
      pick_beeper_advance(@image_height) # delete collumn
      next_collumn()
    end
  end

  def paste_collumn(i)
    point_at(Robota::NORTH)

    collumn = @image_info[i]
    collumn.each do |state|
      put_beeper() if state
      move()
    end
  end

  def paste_image()
    go_to(@image_new_y, @image_new_x)
    @image_width.times do |i|
      paste_collumn(i)
      next_collumn()
    end
  end

  def cut_and_paste()
    @image_info.clear()
    get_information()
    copy_image()
    delete_image()
    paste_image()
  end
end

