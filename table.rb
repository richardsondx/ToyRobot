# Table's Class
class Table
  attr_reader :height, :width

  def initialize(x = 5, y = 5)
    @height = x
    @width = y
  end
end
