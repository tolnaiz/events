require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save empty page" do
    page = Page.new
    assert_not page.save
  end
end
