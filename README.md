# Welcome to the Rover!

## Running Rover
Place the instruction data into a .txt file and place that file in the /data directory. When prompted, use ./data/file_name.txt to use that data. If you do not use your own test data, the default test data file will be used.

cd into rover

bin/rover

OR

cd into rover

rake test

## Assumptions
1. Two or more rovers can occupy the same space (same coordinates), which means an infinite number of rovers can be deployed.
2. All the input data will be well-formed and without error.
3. A rover cannot exit the plateau, and when it reaches a boundary, every move that causes it to collide with the boundary is ignored.

### Notes & FAQ
1. No tests have been written.
2. Test data has been provided.
3. Should it run on a command line? Well, if this was REALLY a console to deploy Mars rovers, definitely not! 
4. How does it receive input? The data is read from a .txt file, and the other input is by keyboard.
5. Can I connect to it through TCP connection using telnet? Nope!
6. Can I view the rover's position in a grid at the start or end of a program run? Not a the moment. However, the rover's initial and final positions (as well as every movement) are transmitted.
