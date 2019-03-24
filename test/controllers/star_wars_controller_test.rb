require 'test_helper'

class StarWarsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get star_wars_home_url
    assert_response :success
  end

  test "should get films" do
    get star_wars_films_url
    assert_response :success
  end

  test "should get ships" do
    get star_wars_ships_url
    assert_response :success
  end

  test "should get planets" do
    get star_wars_planets_url
    assert_response :success
  end

  test "should get characters" do
    get star_wars_characters_url
    assert_response :success
  end

end
