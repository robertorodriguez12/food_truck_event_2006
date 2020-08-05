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
end
