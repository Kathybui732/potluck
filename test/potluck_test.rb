require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test

  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
  end

  def test_it_exits
    assert_instance_of Potluck, @potluck
  end

  def test_initialized_with_a_date
    assert_equal "7-13-18", @potluck.date
  end

  def test_initialized_with_empty_dishes_array
    assert_equal [], @potluck.dishes
  end

  def test_it_can_add_different_dishes_to_array
    assert_equal [@couscous_salad], @potluck.add_dish(@couscous_salad)
    expected = [@couscous_salad, @cocktail_meatballs]
    assert_equal expected , @potluck.add_dish(@cocktail_meatballs)
  end

  def test_it_can_determine_number_of_dishes
    assert_equal 2, @potluck.dishes.length
  end
end
