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
    if on_table?
      # execute commands
      commands.each do |command|
        case command
          when 'MOVE' then @robot.move
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

  # check for PLACE from user input array
  
  def sanitise_input(input)
    index = input.index('PLACE')
    if input.include?('PLACE')
      @commands = input.slice(index, input.length)
    else 
      return false
    end
  end

  # check if robot is placed
  def on_table?
    !@robot.nil? # returns true if robot is on table
  end

end