# Toy Robot

This program simulates a toy robot moving on a square tabletop with a dimension
of 5 units x 5 units. 

The robot is free to roam around the surface and is equipped with a life-saving
logic that saves itself from falling to destruction. Hence, it will ignore 
any requests that cause a risk to its own safety.

To learn how to control the robot please follow the instructions bellow

## Usage
    Usage:
    `ruby toy_robot.rb 'PLACE 0,0,NORTH' 'MOVE' 'REPORT'`

## Dependencies
    ruby 'ruby-2.4.0'
    bundler

    You can run 'bundle install' in the root of the folder to install all
    dependencies

## TEST
  This program was made using a light testing framework called Minitest.

  To run the test do:

  `ruby test/toyrobot.test.rb`


## TRY IT WITH SAMPLE DATA
    ruby toy_robot.rb 'PLACE 0,0,NORTH' 'MOVE' 'REPORT'
    ruby toy_robot.rb 'PLACE 0,0,NORTH' 'MOVE' 'RIGHT' 'MOVE' 'MOVE' 'REPORT'
    ruby toy_robot.rb 'PLACE 1,1,EAST' 'MOVE' 'MOVE' 'LEFT' 'REPORT'
    ruby toy_robot.rb 'PLACE 2,5,SOUTH' 'MOVE' 'MOVE' 'MOVE' 'RIGHT' 'MOVE' 'REPORT'
    ruby toy_robot.rb 'PLACE -1,-1,NORTH' 'MOVE' 'REPORT'
    ruby toy_robot.rb 'PLACE 1,2,SOUTH' 'MOVE' 'MOVE' 'MOVE' 'MOVE' 'REPORT'

## Author

Richardson Dackam < richardsondx@gmail.com >