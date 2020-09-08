class Table

  attr_reader :length, :width
  
  def initialize(length, width)
    @length = length # x
    @width = width # y
  end

  def valid_location?(x, y)
    (0...@length).include?(x) &&
    (0...@width).include?(y)
  end

end