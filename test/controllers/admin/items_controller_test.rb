require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get admin_items_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post admin_items_url, params: { item: { name: @item.name, why_release: @item.why_release } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get admin_item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch admin_item_url(@item), params: { item: { name: @item.name, why_release: @item.why_release } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete admin_item_url(@item)
    end

    assert_redirected_to admin_items_url
  end
end
