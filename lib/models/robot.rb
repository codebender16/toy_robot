module ToyRobot

  class Robot

    attr_reader :position

    def initialize(x, y)
      @position = [x, y]
    end

    def move_east
      @position += 1
    end

    def move_west
      @position -= 1
    end

  end
end
