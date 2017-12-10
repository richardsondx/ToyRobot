# Table's Class
class Table
  attr_reader :height, :width

  def initialize(x, y)
    @height = x
    @width = y
  end
end
