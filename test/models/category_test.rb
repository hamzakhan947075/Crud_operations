require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @category=Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "Name should be present" do
    @category.name=""
    assert_not @category.valid? 
  end
  test "Name should be unique" do
    @category.save
    category2=Category.new(name: "sports")
    assert_not category2.valid?
  end
  test "Name should not too long" do
    @category.name="a"* 26
    assert_not @category.valid?
  end
  test "Name should not too short" do
    @category.name="aa"
    assert_not @category.valid?
  end
end
