class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def menu
    menu_dishes = Hash.new {|hash, key| hash[key] = []}
    @dishes.each do |dish|
      menu_dishes[dish.category] << dish.name
    end
    menu_dishes.each do |category, dish|
      menu_dishes[category] = dish.sort_by { |name| name }
    end
  end

  def ratio(category)
    (get_all_from_category(category).size/@dishes.size.to_f * 100).round(1)
  end
end
