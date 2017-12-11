require_relative '../table'
require 'minitest/autorun'
require 'mocha/mini_test'

# Test for Table Object
class TableTest < Minitest::Test
  def setup
    @table = Table.new
  end

  def test_it_should_initialize_the_table_height
    assert_equal(@table.height, 5)
  end

  def test_it_should_initilaize_the_table_width
    assert_equal(@table.width, 5)
  end
end
