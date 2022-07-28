require "test_helper"

class JoueursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get joueurs_index_url
    assert_response :success
  end

  test "should get show" do
    get joueurs_show_url
    assert_response :success
  end

  test "should get update" do
    get joueurs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get joueurs_destroy_url
    assert_response :success
  end

  test "should get new" do
    get joueurs_new_url
    assert_response :success
  end

  test "should get edit" do
    get joueurs_edit_url
    assert_response :success
  end
end
