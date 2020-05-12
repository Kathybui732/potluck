require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test

  def setup
    @dish = Dish.new("Couscous Salad", :appetizer)
  end

  def test_it_exits
    assert_instance_of Dish, @dish
  end

  def test_dish_initialized_with_a_name
    assert_equal "Couscous Salad", @dish.name
  end

  def test_dish_initialized_with_a_category
    assert_equal :appetizer, @dish.category
  end

end
