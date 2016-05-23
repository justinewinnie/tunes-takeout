require 'test_helper'

class FoodTest < ActiveSupport::TestCase

  test "has a method self.search, returns food instance w/attribute name" do
    assert_equal Food.search("a-la-mode-pies-seattle").name, "A la Mode Pies"
  end

  test "has a method self.search, returns a new food instance" do
    assert_equal Food.search("a-la-mode-pies-seattle"), <Food not initialized>
  end

  # describe "API" do
  #   before do
  #     @instancevariable = Food.find(12)
  # end
  #
  # it "knows its name", :vcr do
  #   assert_equal "instancevariable", @instancevariable.name
  # end


end
