# Constatns
ROTATIONS_AND_TRANSLATIONS = {
  "N" => { "L" => "W", "R" => "E", "step" => 1, "axis" => "y" },
  "S" => { "L" => "E", "R" => "W", "step" => -1, "axis" => "y" },
  "E" => { "L" => "N", "R" => "S", "step" => 1, "axis" => "x" },
  "W" => { "L" => "S", "R" => "N", "step" => -1, "axis" => "x"}
}

# Methods
def set_rover_position(x, y, direction, grid)
  if x.to_i < 0
    x = 0
  elsif x.to_i > grid[0].to_i
    x = grid[0]
  end

  if y.to_i < 0
    y = 0
  elsif y.to_i > grid[1].to_i
    y = grid[1]
  end

  puts "The rover's new position is: #{x} #{y} #{direction}"
  return x, y, direction
end

def move_rover(instruction, current_direction, current_x, current_y, grid)
  if instruction == "R" || instruction == "L"
    set_rover_position(current_x, current_y, rotate_rover(instruction, current_direction), grid)
  elsif instruction == "M"
    new_x, new_y = translate_rover(current_direction, current_x, current_y)
    set_rover_position(new_x, new_y, current_direction, grid)
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

def deploy_rover(initial_position, instructions, grid)
  puts "A new rover has been deployed..."
  current_position = set_rover_position(*initial_position.upcase.split(" "), grid)
  moves = instructions.upcase.split("").select { |x| ["L", "M", "R"].include? x }
  puts
  puts "The rover's instruction set is: "
  p moves
  puts
  moves.each_with_index do |move, index|
    current_position = move_rover(move, current_position[2], current_position[0], current_position[1], grid)
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
