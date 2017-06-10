require 'test_helper'

class AjaxControllerTest < ActionDispatch::IntegrationTest
  test "should get group_labels" do
    get ajax_group_labels_url
    assert_response :success
  end

  test "should get entry_labels" do
    get ajax_entry_labels_url
    assert_response :success
  end

end
