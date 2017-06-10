require 'test_helper'

class WorkInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_info = work_infos(:one)
  end

  test "should get index" do
    get work_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_work_info_url
    assert_response :success
  end

  test "should create work_info" do
    assert_difference('WorkInfo.count') do
      post work_infos_url, params: { work_info: { amount: @work_info.amount, entry_info_id: @work_info.entry_info_id, name: @work_info.name, price: @work_info.price, units: @work_info.units } }
    end

    assert_redirected_to work_info_url(WorkInfo.last)
  end

  test "should show work_info" do
    get work_info_url(@work_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_info_url(@work_info)
    assert_response :success
  end

  test "should update work_info" do
    patch work_info_url(@work_info), params: { work_info: { amount: @work_info.amount, entry_info_id: @work_info.entry_info_id, name: @work_info.name, price: @work_info.price, units: @work_info.units } }
    assert_redirected_to work_info_url(@work_info)
  end

  test "should destroy work_info" do
    assert_difference('WorkInfo.count', -1) do
      delete work_info_url(@work_info)
    end

    assert_redirected_to work_infos_url
  end
end
