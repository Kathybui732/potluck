require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test

  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
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
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@cocktail_meatballs)
    assert_equal 2, @potluck.dishes.length
  end

  def test_it_can_get_all_from_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    full_array = [@couscous_salad, @summer_pizza, @roast_pork, @cocktail_meatballs, @candy_salad]
    expected = [@couscous_salad, @summer_pizza]
    assert_equal expected, @potluck.get_all_from_category(:appetizer)
    refute_equal full_array, @potluck.get_all_from_category(:appetizer)
  end

  def test_access_and_name_values_from_category_specific_dishes_array
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    assert_equal @couscous_salad, @potluck.get_all_from_category(:appetizer).first
    assert_equal @summer_pizza, @potluck.get_all_from_category(:appetizer)[1]
    assert_equal "Couscous Salad", @potluck.get_all_from_category(:appetizer).first.name
    assert_equal "Summer Pizza", potluck.get_all_from_category(:appetizer)[2].name
  end
end
