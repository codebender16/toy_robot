class Robot

    attr_reader :position, :direction

    DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

    def initialize(x, y, direction)
      @position = [x, y]
      @direction = direction
    end

  # methods for rotation left or right

    def turn_left
      @direction = DIRECTIONS[DIRECTIONS.index(@direction) - 1]
    end

    def turn_right
      if @direction == 'WEST'
        @direction = DIRECTIONS[0]
      else
        @direction = DIRECTIONS[DIRECTIONS.index(@direction) + 1]
      end
    end

    # methods for movements of Robot

    def move
      case @direction
        when "NORTH" then move_north
        when "SOUTH" then move_south
        when "EAST" then move_east
        when "WEST" then move_west
      end
    end

    def move_east
      @position[0] += 1
    end

    def move_west
      @position[0] -= 1
    end

    def move_north
      @position[1] += 1
    end

    def move_south
      @position[1] -= 1
    end

    # generate object for report to be used in robot_controller during execution

    def report
      return {
        x: @position[0],
        y: @position[1],
        direction: @direction
      }
    end



end
