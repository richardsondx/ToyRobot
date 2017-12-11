require_relative '../toy_robot'
require 'minitest/autorun'
require 'mocha/mini_test'

# Tests for ToyRobot Object
class ToyRobotTest < Minitest::Test
  def setup
    @toy_robot = ToyRobot.new
  end

  def test_it_handle_instructions
    @toy_robot.send(:handle_instructions, ['PLACE', '1,2,NORTH'])
    assert_equal(1, @toy_robot.x)
    assert_equal(2, @toy_robot.y)
    assert_equal('NORTH', @toy_robot.facing)
  end

  def test_it_should_work_with_sample_data_a
    @toy_robot.command('PLACE 0,0,NORTH')
    @toy_robot.command('MOVE')
    assert_equal('0,1,NORTH', @toy_robot.command('REPORT'))
  end

  def test_it_should_work_with_sample_data_array
    assert_equal(
      '0,1,NORTH',
      @toy_robot.command(['PLACE 0,0,NORTH', 'MOVE', 'REPORT'])
    )
  end

  def test_it_should_work_with_sample_data_b
    @toy_robot.command('PLACE 0,0,NORTH')
    @toy_robot.command('LEFT')
    assert_equal('0,0,WEST', @toy_robot.command('REPORT'))
  end

  def test_it_should_work_with_sample_data_c
    @toy_robot.command('PLACE 0,0,NORTH')
    @toy_robot.command('MOVE')
    assert_equal('0,1,NORTH', @toy_robot.command('REPORT'))
  end

  def test_it_should_return_nil_if_not_placed
    @toy_robot.command('MOVE')
    assert_nil(@toy_robot.command('REPORT'))
  end

  def test_it_cant_moved_outside_of_the_table_east_north_edges
    @toy_robot.x = 5
    @toy_robot.y = 5
    @toy_robot.facing = 'EAST'
    @toy_robot.send(:move)
    assert_equal(5, @toy_robot.x)
    @toy_robot.facing = 'NORTH'
    assert_equal(5, @toy_robot.y)
  end

  def test_it_cant_moved_outside_of_the_table_west_south_edges
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'WEST'
    assert_equal(0, @toy_robot.x)
    @toy_robot.facing = 'SOUTH'
    assert_equal(0, @toy_robot.y)
  end

  def test_it_cant_be_placed_outside_of_the_table
    @toy_robot.send(:place, -1, -1, 'NORTH')
    assert_nil(@toy_robot.x)
    assert_nil(@toy_robot.y)
    assert_nil(@toy_robot.facing)

    @toy_robot.send(:place, 6, 3, 'NORTH')
    assert_nil(@toy_robot.x)
    assert_nil(@toy_robot.y)
    assert_nil(@toy_robot.facing)
  end

  def test_directions
    assert_equal(%w[WEST NORTH EAST SOUTH], @toy_robot.send(:directions))
  end

  def test_rotate_right_when_not_placed
    @toy_robot.facing = 'NORTH'
    @toy_robot.send(:rotate, 'RIGHT')
    assert_equal(@toy_robot.facing, 'NORTH')
  end

  def test_rotate_right_when_placed
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'NORTH'
    @toy_robot.send(:rotate, 'RIGHT')
    assert_equal(@toy_robot.facing, 'EAST')
  end

  def test_rotate_left
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'NORTH'
    @toy_robot.send(:rotate, 'LEFT')
    assert_equal('WEST', @toy_robot.facing)
  end

  def test_turn_left
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'NORTH'
    @toy_robot.send(:turn_left)
    assert_equal('WEST', @toy_robot.facing)
  end

  def test_turn_right
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'NORTH'
    @toy_robot.send(:turn_right)
    assert_equal('EAST', @toy_robot.facing)
  end

  def test_move_east
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'EAST'
    @toy_robot.send(:move)
    assert_equal(1, @toy_robot.x)
  end

  def test_move_west
    @toy_robot.x = 2
    @toy_robot.y = 0
    @toy_robot.facing = 'WEST'
    @toy_robot.send(:move)
    assert_equal(1, @toy_robot.x)
  end

  def test_move_north
    @toy_robot.x = 0
    @toy_robot.y = 0
    @toy_robot.facing = 'NORTH'
    @toy_robot.send(:move)
    assert_equal(1, @toy_robot.y)
  end

  def test_move_south
    @toy_robot.x = 0
    @toy_robot.y = 2
    @toy_robot.facing = 'SOUTH'
    @toy_robot.send(:move)
    assert_equal(1, @toy_robot.y)
  end

  def test_place
    @toy_robot.send(:place, 1, 2, 'NORTH')
    assert_equal(1, @toy_robot.x)
    assert_equal(2, @toy_robot.y)
    assert_equal('NORTH', @toy_robot.facing)
  end

  def test_report
    @toy_robot.x = 1
    @toy_robot.y = 2
    @toy_robot.facing = 'NORTH'
    assert_equal('1,2,NORTH', @toy_robot.send(:report))
  end

  def test_off_edge_return_true
    assert_equal(true, @toy_robot.send(:off_edge?, 6, 6))
  end

  def test_off_edge_return_false
    assert_equal(false, @toy_robot.send(:off_edge?, 5, 5))
  end
end
