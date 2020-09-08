class Robot

    attr_reader :position, :direction

    DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

    def initialize(x, y, direction)
      @position = [x, y]
      @direction = direction
    end

  # methods for rotation left or right
    
    def turn(rotation)
      case rotation
        when 'LEFT' then turn_left
        when 'RIGHT' then turn_right
      end
    end

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

    # source from reference - understand how ti works but don't normally use rotate

    # def turn_right
    #   index = DIRECTIONS.index(@direction)
    #   @direction = DIRECTIONS.rotate(1)[index]
    # end

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

    # report 

    def report
      return {
        x: @position[0],
        y: @position[1],
        direction: @direction
      }
    end


end
