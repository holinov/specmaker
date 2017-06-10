require 'test_helper'

class EntryInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_info = entry_infos(:one)
  end

  test "should get index" do
    get entry_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_info_url
    assert_response :success
  end

  test "should create entry_info" do
    assert_difference('EntryInfo.count') do
      post entry_infos_url, params: { entry_info: { group_id: @entry_info.group_id } }
    end

    assert_redirected_to entry_info_url(EntryInfo.last)
  end

  test "should show entry_info" do
    get entry_info_url(@entry_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_info_url(@entry_info)
    assert_response :success
  end

  test "should update entry_info" do
    patch entry_info_url(@entry_info), params: { entry_info: { group_id: @entry_info.group_id } }
    assert_redirected_to entry_info_url(@entry_info)
  end

  test "should destroy entry_info" do
    assert_difference('EntryInfo.count', -1) do
      delete entry_info_url(@entry_info)
    end

    assert_redirected_to entry_infos_url
  end
end
