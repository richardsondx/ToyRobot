require_relative '../toy_robot'
require 'minitest/autorun'
require 'mocha/mini_test'

class ToyRobotTest < Minitest::Test
  def setup
    @toy_robot = ToyRobot.new
  end

  def test_it_should_work_with_sample_data_a
    STDIN.stubs(:gets).returns('PLACE 0,0,NORTH', 'MOVE', 'REPORT')
    assert_equal('0,1,NORTH', @toy_robot.ask_for_instructions)
  end
  
  def test_it_should_work_with_sample_data_b
    STDIN.stubs(:gets).returns('PLACE 0,0,NORTH', 'LEFT', 'REPORT')
    assert_equal('0,0,WEST', @toy_robot.ask_for_instructions)
  end

  def test_it_should_work_with_sample_data_c
    STDIN.stubs(:gets).returns(
      'PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE', 'REPORT'
    )
    assert_equal('3,3,NORTH', @toy_robot.ask_for_instructions)
  end
end