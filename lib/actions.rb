module Actions
  def set_rover_position(x, y, direction)
    puts "The rover's new position is: #{x} #{y} #{direction}"
    return x, y, direction
  end

  def move_rover(instruction, current_direction, current_x, current_y)
    if instruction == "R" || instruction == "L"
      set_rover_position(current_x, current_y, rotate_rover(instruction, current_direction))
    elsif instruction == "M"
      new_x, new_y = translate_rover(current_direction, current_x, current_y)
      set_rover_position(new_x, new_y, current_direction)
    end
  end

  def rotate_rover(instruction, current_direction)
    ROTATIONS_AND_TRANSLATIONS[current_direction][instruction]
  end

  def translate_rover(current_direction, current_x, current_y)
    step = ROTATIONS_AND_TRANSLATIONS[current_direction]['step']
    axis = ROTATIONS_AND_TRANSLATIONS[current_direction]['axis']

    if axis == "x"
      new_x = current_x.to_i + step
      new_y = current_y.to_i
    elsif axis == "y"
      new_x = current_x.to_i
      new_y = current_y.to_i + step
    end
    return new_x, new_y
  end

  def deploy_rover(initial_position, instructions)
    puts "A new rover has been deployed..."
    current_position = set_rover_position(*initial_position.upcase.split(" "))
    moves = instructions.upcase.split("").select { |x| ["L", "M", "R"].include? x }
    puts
    puts "The rover's instruction set is: "
    p moves
    puts
    moves.each_with_index do |move, index|
      current_position = move_rover(move, current_position[2], current_position[0], current_position[1])
      if index == moves.length - 1
        puts "......................................"
        puts "The rover's final position is: "
        p current_position
        puts "......................................"
        puts
        puts
      end
    end
    current_position
  end
end
