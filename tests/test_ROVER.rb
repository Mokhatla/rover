require "./lib/rover.rb"
require "test/unit"

puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--"
puts "Welcome to Mars Rover Deployment Console Test..."
puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--"
puts

my_file = './data/test.txt'

puts

begin
  puts "Locating file..."
  puts "..."
  deployment_instructions = File.readlines(my_file)
rescue
  puts "Sorry. There was a problem locating the Instruction File..."
end

if deployment_instructions
  grid = deployment_instructions[0].split("")
  puts "The plateau size is #{grid[0]}x#{grid[1]}"
  puts
  collect_rovers = deployment_instructions[1..-1]

  rovers = []
  deployed_rovers = []
  collect_rovers.each_slice(2) { |data| rovers << data }
  puts

  rovers.each do |rover|
    deployed_rovers << deploy_rover(rover[0], rover[1], grid)
  end
end
puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"
puts "The deployment console has been closed. Goodbye!"
puts "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"
