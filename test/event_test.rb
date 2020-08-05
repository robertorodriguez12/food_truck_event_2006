require 'minitest/autorun'
require 'minitest/nyan_cat'
require 'pry'
require './lib/food_truck'
require './lib/item'
require './lib/event'

class EventTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
    assert_equal "South Pearl Street Farmers Market", event.name
    assert_equal [], event.food_trucks
  end


end
