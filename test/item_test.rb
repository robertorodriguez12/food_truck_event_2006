require 'minitest/autorun'
require 'minitest/nyan_cat'
require 'pry'
require './lib/item'

class ItemTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    assert_instance_of Item, item1
    assert_instance_of Item, item2
    assert_equal 'Peach Pie (Slice)', item1.name
    assert_equal 3.75, item1.price
    assert_equal "Apple Pie (Slice)", item2.name
    assert_equal 2.50, item2.price
  end


end
