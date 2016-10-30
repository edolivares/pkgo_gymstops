require 'test_helper'

class PokestopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokestops_index_url
    assert_response :success
  end

end
