require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    sign_in users(:one)
  end

  test "should get index with correct number of categories returned" do
    get categories_url
    assert_response :success
    assert_equal 2, assigns(:categories).count
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name, user_id: @category.user_id } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: @category.name, user_id: @category.user_id } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

  test "show should only work for owner" do
    get category_url(categories(:three))
    assert_response 403
  end

  test "delete should only work for owner" do
    assert_no_difference('Category.count') do
      delete category_url(categories(:three))
    end
  end

end
