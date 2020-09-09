require_relative '../models/robot.rb'
require_relative '../models/table.rb'


class RobotController

  attr_reader :robot, :commands

  @commands = []

 # constraint placed on the placement of the robot
  def initialize(table)
    @table = table
  end

# check for validity of position before placing the robot
  def place(x, y, direction)
    if not @table.valid_location?(x, y)
      return 'invalid location'
    else
    # create a robot in Robot class
      @robot = Robot.new(x,y, direction)
    end
  end

  def execute(commands)
  # only executes when robot is placed
  # the below place case would be the second PLACE input from user
    if on_table?
      # execute commands
      commands.each do |command|
        case command
          when 'PLACE' then place(command[1], command[2], command[3])
          when 'MOVE' then valid_move?
          when 'LEFT' then @robot.turn_left
          when 'RIGHT' then @robot.turn_right
          when 'REPORT' then @robot.report
        end
      end
    else 
      # ignore commands 
      return on_table? # this will be used in the menu
    end 

  end

  # check for valid movement to prevent falling

  # return true/false if new position is not valid
  def valid_move?
    
    x = @robot.position[0]
    y = @robot.position[1]
    
    # check for direction and the next position
    case @robot.direction
        when "NORTH" then (y += 1)
        when "SOUTH" then (y -= 1)
        when "EAST" then (x += 1)
        when "WEST" then (x -= 1)
    end

    # check for valid position
  
    if not @table.valid_location?(x, y)
      return "Robot can only move within the table"
    else 
      @robot.move
    end

  end

  # check for PLACE from user input array

  def sanitise_input(input)
    # example input [['PLACE', x, y, f], MOVE, MOVE, ['PLACE', x, y, f]]
    # loop to check if PLACE is within the 2D array
    input.each do |item|
      if item.include?('PLACE')
        index = input.index(item)
        @commands = input.slice(index, input.length)
        break
      end
    end
  end

  # check if robot is placed
  def on_table?
    !@robot.nil? # returns true if robot is on table
  end

end