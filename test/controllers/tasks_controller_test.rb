require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @unowned_task = tasks(:four)
    sign_in users(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
    assert_equal 3, assigns(:tasks).count
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { category_id: @task.category_id, date: @task.date, mark: @task.mark, name: @task.name } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { category_id: @task.category_id, date: @task.date, mark: @task.mark, name: @task.name } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test "should not show unowned task" do
    get task_url(@unowned_task)
    assert_response 403
  end

  test "should not delete unowned task" do
    assert_no_difference('Task.count') do
      delete task_url(@unowned_task)
    end
  end

  test "should not update unowned task" do
    patch task_url(@unowned_task), params: { task: { category_id: @unowned_task.category_id, date: @unowned_task.date, mark: @unowned_task.mark, name: @unowned_task.name } }
    assert_response 403
  end

  test "user cannot create task for unowned category" do
    assert_no_difference('Task.count') do
      post tasks_url, params: { task: { category_id: @unowned_task.category_id, date: @unowned_task.date, mark: @unowned_task.mark, name: @unowned_task.name } }
    end
  end
end
