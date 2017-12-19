require_relative 'table'

# Robot's Class
class ToyRobot
  attr_accessor :x, :y, :facing
  attr_reader :table

  def initialize(user_input = nil)
    @table = Table.new(5, 5)
    command(user_input) if user_input
  end

  def command(inputs)
    if inputs.is_a? Array
      result = ''
      inputs.each do |input|
        instructions = input.split(' ')
        result = handle_instructions(instructions)
      end
      result
    else
      instructions = inputs.split(' ')
      handle_instructions(instructions)
    end
  end

  private

  def directions
    %w[WEST NORTH EAST SOUTH]
  end

  def handle_instructions(instructions)
    action = instructions[0]

    case action
    when 'PLACE'
      position = instructions[1].split(',')
      place(position[0].to_i, position[1].to_i, position[2])
    when 'MOVE'
      move
    when /^(LEFT|RIGHT)$/
      rotate(action)
    when 'REPORT'
      report
    end
  end

  def rotate(direction)
    return if placed? == false
    if direction == 'LEFT'
      turn_left
    else
      turn_right
    end
  end

  def turn_right
    @facing = if directions.index(@facing) == 3
                directions[0]
              else
                directions[directions.index(@facing) + 1]
              end
  end

  def turn_left
    @facing = if directions.index(@facing).zero?
                directions[-1]
              else
                directions[directions.index(@facing) - 1]
              end
  end

  def move
    return if placed? == false

    case @facing
    when 'WEST'
      @x -= 1 unless @x.zero?
    when 'EAST'
      @x += 1 unless @x == @table.width
    when 'SOUTH'
      @y -= 1 unless @y.zero?
    when 'NORTH'
      @y += 1 unless @y == @table.height
    end
  end

  def place(x, y, facing)
    return if off_edge?(x, y)
    @x = x
    @y = y
    @facing = facing
  end

  def report
    return if placed? == false
    result = "#{@x},#{@y},#{@facing}"
    puts result
    result
  end

  def placed?
    if @x.nil? && @y.nil?
      false
    else
      true
    end
  end

  def off_edge?(x, y)
    if (x > @table.height) || (y > @table.width)
      true
    elsif (x < 0) || (y < 0)
      true
    else
      false
    end
  end
end

ToyRobot.new ARGV
