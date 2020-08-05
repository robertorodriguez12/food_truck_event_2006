class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []

  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map{|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    hash = Hash.new{|h, k| h[k] = {quantity:0, food_trucks: []}}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        hash[item][:quantity] += amount
        hash[item][:food_trucks] << food_truck
      end
    end
    hash
  end

  def overstocked_items
    total_inventory.keys.find_all do |item|
      total_inventory[item][:quantity] > 50 && total_inventory[item][:food_trucks].count > 1
    end
  end

  def sorted_item_list
    items = total_inventory.keys.map do |item|
      item.name
    end
    items.sort
  end

  def sell(item, quantity)
    if total_inventory[item].nil? || total_inventory[item][:quantity] < quantity
      return false
    else
      total_inventory[item][:food_trucks].each do |food_truck|
        if food_truck.check_stock(item) < quantity
          stock= food_truck.check_stock(item)
          food_truck.sell(item, stock)
          quantity -= stock
        else
          food_truck.sell(item, quantity)
        end
      end
    end
    true
  end
end
