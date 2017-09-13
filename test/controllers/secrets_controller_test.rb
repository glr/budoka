require 'test_helper'

class SecretsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get secrets_show_url
    assert_response :success
  end

end
