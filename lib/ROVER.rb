require 'actions'
require 'constants'

puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--"
puts "Welcome to Mars Rover Deployment Console..."
puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--"
puts
puts "Please enter the the path to the Instruction File: "
puts

my_file = gets.chomp
puts

begin
  puts "Locating file..."
  puts "..."
  deployment_instructions = File.readlines(my_file)
rescue
  puts "Sorry. There was a problem locating the Instruction File..."
end

if deployment_instructions
  grid_size = deployment_instructions[0].split("")
  puts "The plateau size is #{grid_size[0]}x#{grid_size[1]}"
  puts
  collect_rovers = deployment_instructions[1..-1]

  rovers = []
  deployed_rovers = []
  collect_rovers.each_slice(2) { |data| rovers << data }
  puts

  rovers.each do |rover|
    deployed_rovers << deploy_rover(rover[0], rover[1])
  end
end
puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"
puts "The deployment console has been closed. Goodbye!"
puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"
puts " "
puts " "
puts "
