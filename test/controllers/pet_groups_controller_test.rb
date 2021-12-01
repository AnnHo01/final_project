require "test_helper"

class PetGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pet_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get pet_groups_show_url
    assert_response :success
  end
end
