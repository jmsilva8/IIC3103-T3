require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get film" do
    get pages_film_url
    assert_response :success
  end

  test "should get character" do
    get pages_character_url
    assert_response :success
  end

  test "should get ship" do
    get pages_ship_url
    assert_response :success
  end

  test "should get planet" do
    get pages_planet_url
    assert_response :success
  end

end
