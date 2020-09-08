module ToyRobot

  class Robot

    attr_reader :position, :direction

    def initialize(x, y, direction)
      @position = [x, y]
      @direction = direction
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

  end
end
