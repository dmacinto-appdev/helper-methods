class MoviesTest < ApplicationSystemTestCase
  test "h1 test" do
    visit "/movies"
    assert_selector "h1", text: "List of all movies"
  end

end
