require 'test_helper'

class FieldInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field_info = field_infos(:one)
  end

  test "should get index" do
    get field_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_field_info_url
    assert_response :success
  end

  test "should create field_info" do
    assert_difference('FieldInfo.count') do
      post field_infos_url, params: { field_info: { name: @field_info.name, sort_order: @field_info.sort_order, unit_name: @field_info.unit_name } }
    end

    assert_redirected_to field_info_url(FieldInfo.last)
  end

  test "should show field_info" do
    get field_info_url(@field_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_field_info_url(@field_info)
    assert_response :success
  end

  test "should update field_info" do
    patch field_info_url(@field_info), params: { field_info: { name: @field_info.name, sort_order: @field_info.sort_order, unit_name: @field_info.unit_name } }
    assert_redirected_to field_info_url(@field_info)
  end

  test "should destroy field_info" do
    assert_difference('FieldInfo.count', -1) do
      delete field_info_url(@field_info)
    end

    assert_redirected_to field_infos_url
  end
end
