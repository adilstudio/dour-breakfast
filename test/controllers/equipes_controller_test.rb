require "test_helper"

class EquipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get equipes_index_url
    assert_response :success
  end
end
